#include "i2c_master.h"

#include "32mz_interrupt_control.h"
#include "error_handler.h"

/**
  I2C Driver Queue Status Type
  @Summary
    Defines the type used for the transaction queue status.
  @Description
    This defines type used to keep track of the queue status.
 */

typedef union
{
    volatile __attribute__((coherent)) struct
    {
            uint8_t full:1;
            uint8_t empty:1;
            uint8_t reserved:6;
    }s;
    volatile __attribute__((coherent)) uint8_t status;
}I2C_TR_QUEUE_STATUS;

/**
  I2C Driver Queue Entry Type
  @Summary
    Defines the object used for an entry in the i2c queue items.
  @Description
    This defines the object in the i2c queue. Each entry is a composed
    of a list of TRBs, the number of the TRBs and the status of the
    currently processed TRB.
 */
volatile __attribute__((coherent)) typedef struct
{
    uint32_t                             count;          // a count of trb's in the trb list
    I2C_TRANSACTION_REQUEST_BLOCK *ptrb_list;     // pointer to the trb list
    I2C_MESSAGE_STATUS            *pTrFlag;       // set with the error of the last trb sent.
                                                        // if all trb's are sent successfully,
                                                        // then this is I2C_MESSAGE_COMPLETE
} I2C_TR_QUEUE_ENTRY;

/**
  I2C Master Driver Object Type
  @Summary
    Defines the object that manages the i2c master.
  @Description
    This defines the object that manages the sending and receiving of
    i2c master transactions.
  */

volatile __attribute__((coherent)) typedef struct
{
    /* Read/Write Queue */
    I2C_TR_QUEUE_ENTRY          *pTrTail;       // tail of the queue
    I2C_TR_QUEUE_ENTRY          *pTrHead;       // head of the queue
    I2C_TR_QUEUE_STATUS         trStatus;       // status of the last transaction
    uint32_t                         i2cDoneFlag;    // flag to indicate the current
                                                    // transaction is done
    uint32_t                         i2cErrors;      // keeps track of errors


} I2C_OBJECT ;

/**
  I2C Master Driver State Enumeration
  @Summary
    Defines the different states of the i2c master.
  @Description
    This defines the different states that the i2c master
    used to process transactions on the i2c bus.
*/

volatile __attribute__((coherent)) typedef enum
{
    S_MASTER_IDLE,
    S_MASTER_RESTART,
    S_MASTER_SEND_ADDR,
    S_MASTER_SEND_DATA,
    S_MASTER_SEND_STOP,
    S_MASTER_ACK_ADDR,
    S_MASTER_RCV_DATA,
    S_MASTER_RCV_STOP,
    S_MASTER_ACK_RCV_DATA,
    S_MASTER_NOACK_STOP,
    S_MASTER_SEND_ADDR_10BIT_LSB,
    S_MASTER_10BIT_RESTART,

} I2C_MASTER_STATES;

/**
 Section: Macro Definitions
*/

/* defined for I2C */

#ifndef I2C_CONFIG_TR_QUEUE_LENGTH
        #define I2C_CONFIG_TR_QUEUE_LENGTH 2048
#endif


#define I2C_TRANSMIT_REG                       I2C1TRN                 // Defines the transmit register used to send data.
#define I2C_RECEIVE_REG                        I2C1RCV                 // Defines the receive register used to receive data.

// The following control bits are used in the I2C state machine to manage
// the I2C module and determine next states.
#define I2C_WRITE_COLLISION_STATUS_BIT         I2C1STATbits.IWCOL     // Defines the write collision status bit.

#define I2C_START_CONDITION_ENABLE_BIT         I2C1CONbits.SEN      // I2C START control bit.
#define I2C_REPEAT_START_CONDITION_ENABLE_BIT  I2C1CONbits.RSEN     // I2C Repeated START control bit.
#define I2C_RECEIVE_ENABLE_BIT                 I2C1CONbits.RCEN     // I2C Receive enable control bit.
#define I2C_STOP_CONDITION_ENABLE_BIT          I2C1CONbits.PEN      // I2C STOP control bit.
#define I2C_ACKNOWLEDGE_ENABLE_BIT             I2C1CONbits.ACKEN    // I2C ACK start control bit.
#define I2C_ACKNOWLEDGE_DATA_BIT               I2C1CONbits.ACKDT    // I2C ACK data control bit.
#define I2C_ACKNOWLEDGE_STATUS_BIT             I2C1STATbits.ACKSTAT  // I2C ACK status bit.


#define I2C_7bit    true

 /**
 Section: Local Functions
*/

void I2C_FunctionComplete(void);
void I2C_Stop(I2C_MESSAGE_STATUS completion_code);

/**
 Section: Local Variables
*/

static I2C_TR_QUEUE_ENTRY                  i2c2_tr_queue[I2C_CONFIG_TR_QUEUE_LENGTH];
static I2C_OBJECT                          i2c2_object;
static I2C_MASTER_STATES                   i2c2_state = S_MASTER_IDLE;
static uint32_t                            i2c2_trb_count = 0;

static I2C_TRANSACTION_REQUEST_BLOCK      *p_i2c2_trb_current = NULL;
static volatile I2C_TR_QUEUE_ENTRY        *p_i2c2_current = NULL;


/**
  Section: Driver Interface
*/

void I2C_Initialize(void)
{
    i2c2_object.pTrHead = i2c2_tr_queue;
    i2c2_object.pTrTail = i2c2_tr_queue;
    i2c2_object.trStatus.s.empty = true;
    i2c2_object.trStatus.s.full = false;

    i2c2_object.i2cErrors = 0;

    disableInterrupt(I2C1_Master_Event);
    setInterruptPriority(I2C1_Master_Event, 7);
    setInterruptSubpriority(I2C1_Master_Event, 1);

    disableInterrupt(I2C1_Bus_Collision_Event);
    setInterruptPriority(I2C1_Bus_Collision_Event, 4);
    setInterruptSubpriority(I2C1_Bus_Collision_Event, 0);

    // setup I2C1 CON register
    I2C1CONbits.PCIE = 0;       // disable stop condition interrupt (slave mode only)
    I2C1CONbits.SCIE = 0;       // disable start condition interrupt (slave mode only)
    I2C1CONbits.BOEN = 0;       // disable buffer overwrite interrupt (slave mode only)
    I2C1CONbits.SDAHT = 0;      // 100 ns hold time after falling edge of SCL
    I2C1CONbits.SBCDE = 0;      // disable slave bus collision interrupt
    I2C1CONbits.SIDL = 1;       // disable in IDLE mode
    I2C1CONbits.DISSLW = 0;     // enable slew rate control
    I2C1CONbits.SMEN = 0;       // disable SMBus threshold levels

    // setup I2C baud rate
    // clock source is PBCLK2
    // Larger numbers in this register correspond to slower baud rates
    I2C1BRG = 0x04A;
    
    // clear the interrupt flags
    clearInterruptFlag(I2C1_Bus_Collision_Event);
    clearInterruptFlag(I2C1_Master_Event);

    // enable the interrupts
    enableInterrupt(I2C1_Master_Event);
    enableInterrupt(I2C1_Bus_Collision_Event);

    // enable I2C1 module
    I2C1CONbits.ON = 1;

}


uint32_t I2C_ErrorCountGet(void)
{
    uint32_t ret;

    ret = i2c2_object.i2cErrors;
    return ret;
}

void __ISR(_I2C1_MASTER_VECTOR, IPL7SRS) I2C_MASTER_ISR ( void )
{

    static uint8_t  *pi2c_buf_ptr;
    static uint16_t i2c_address         = 0;
    static uint32_t  i2c_bytes_left      = 0;
    static uint32_t  i2c_10bit_address_restart = 0;

    // clearInterruptFlag(I2C1_Master_Event);

    // Check first if there was a collision.
    // If we have a Write Collision, reset and go to idle state */
    if(I2C_WRITE_COLLISION_STATUS_BIT)
    {
        // clear the Write colision
        I2C_WRITE_COLLISION_STATUS_BIT = 0;
        i2c2_state = S_MASTER_IDLE;
        *(p_i2c2_current->pTrFlag) = I2C_MESSAGE_FAIL;

        // reset the buffer pointer
        p_i2c2_current = NULL;

        return;
    }

    /* Handle the correct i2c state */
    switch(i2c2_state)
    {
        case S_MASTER_IDLE:    /* In reset state, waiting for data to send */

            if(i2c2_object.trStatus.s.empty != true)
            {
                // grab the item pointed by the head
                p_i2c2_current     = i2c2_object.pTrHead;
                i2c2_trb_count     = i2c2_object.pTrHead->count;
                p_i2c2_trb_current = i2c2_object.pTrHead->ptrb_list;

                i2c2_object.pTrHead++;

                // check if the end of the array is reached
                if(i2c2_object.pTrHead == (i2c2_tr_queue + I2C_CONFIG_TR_QUEUE_LENGTH))
                {
                    // adjust to restart at the beginning of the array
                    i2c2_object.pTrHead = i2c2_tr_queue;
                }

                // since we moved one item to be processed, we know
                // it is not full, so set the full status to false
                i2c2_object.trStatus.s.full = false;

                // check if the queue is empty
                if(i2c2_object.pTrHead == i2c2_object.pTrTail)
                {
                    // it is empty so set the empty status to true
                    i2c2_object.trStatus.s.empty = true;
                }

                // send the start condition
                I2C_START_CONDITION_ENABLE_BIT = 1;

                // start the i2c request
                i2c2_state = S_MASTER_SEND_ADDR;
            }

            break;

        case S_MASTER_RESTART:

            /* check for pending i2c Request */

            // ... trigger a REPEATED START
            I2C_REPEAT_START_CONDITION_ENABLE_BIT = 1;

            // start the i2c request
            i2c2_state = S_MASTER_SEND_ADDR;

            break;

        case S_MASTER_SEND_ADDR:

            /* Start has been sent, send the address byte */

            /* Note: 
                On a 10-bit address resend (done only during a 10-bit
                device read), the original i2c_address was modified in
                S_MASTER_10BIT_RESTART state. So the check if this is
                a 10-bit address will fail and a normal 7-bit address
                is sent with the R/W bit set to read. The flag
                i2c_10bit_address_restart prevents the  address to
                be re-written.
             */
            
            // extract the information for this message
            i2c_address    = p_i2c2_trb_current->address;
            pi2c_buf_ptr   = p_i2c2_trb_current->pbuffer;
            i2c_bytes_left = p_i2c2_trb_current->length;
            
            // Transmit the address
            I2C_TRANSMIT_REG = i2c_address;
            if(i2c_address & 0x01)
            {
                // Next state is to wait for address to be acked
                i2c2_state = S_MASTER_ACK_ADDR;
            }
            else
            {
                // Next state is transmit
                i2c2_state = S_MASTER_SEND_DATA;
            }
            break;

        case S_MASTER_SEND_DATA:

            // Make sure the previous byte was acknowledged
            if(I2C_ACKNOWLEDGE_STATUS_BIT)
            {
                // Transmission was not acknowledged
                i2c2_object.i2cErrors++;

                // Reset the Ack flag
                I2C_ACKNOWLEDGE_STATUS_BIT = 0;

                // Send a stop flag and go back to idle
                I2C_Stop(I2C_DATA_NO_ACK);

            }
            else
            {
                // Did we send them all ?
                if(i2c_bytes_left-- == 0)
                {
                    // yup sent them all!

                    // update the trb pointer
                    p_i2c2_trb_current++;

                    // are we done with this string of requests?
                    if(--i2c2_trb_count == 0)
                    {
                        I2C_Stop(I2C_MESSAGE_COMPLETE);
                    }
                    else
                    {
                        // no!, there are more TRB to be sent.
                        //I2C_START_CONDITION_ENABLE_BIT = 1;

                        // In some cases, the slave may require
                        // a restart instead of a start. So use this one
                        // instead.
                        I2C_REPEAT_START_CONDITION_ENABLE_BIT = 1;

                        // start the i2c request
                        i2c2_state = S_MASTER_SEND_ADDR;

                    }
                }
                else
                {
                    // Grab the next data to transmit
                    I2C_TRANSMIT_REG = *pi2c_buf_ptr++;
                }
            }
            break;

        case S_MASTER_ACK_ADDR:

            /* Make sure the previous byte was acknowledged */
            if(I2C_ACKNOWLEDGE_STATUS_BIT)
            {

                // Transmission was not acknowledged
                i2c2_object.i2cErrors++;

                // Send a stop flag and go back to idle
                I2C_Stop(I2C_MESSAGE_ADDRESS_NO_ACK);

                // Reset the Ack flag
                I2C_ACKNOWLEDGE_STATUS_BIT = 0;
            }
            else
            {
                I2C_RECEIVE_ENABLE_BIT = 1;
                i2c2_state = S_MASTER_ACK_RCV_DATA;
            }
            break;

        case S_MASTER_RCV_DATA:

            /* Acknowledge is completed.  Time for more data */

            // Next thing is to ack the data
            i2c2_state = S_MASTER_ACK_RCV_DATA;

            // Set up to receive a byte of data
            I2C_RECEIVE_ENABLE_BIT = 1;

            break;

        case S_MASTER_ACK_RCV_DATA:

            // Grab the byte of data received and acknowledge it
            *pi2c_buf_ptr++ = I2C_RECEIVE_REG;

            // Check if we received them all?
            if(--i2c_bytes_left)
            {

                /* No, there's more to receive */

                // No, bit 7 is clear.  Data is ok
                // Set the flag to acknowledge the data
                I2C_ACKNOWLEDGE_DATA_BIT = 0;

                // Wait for the acknowledge to complete, then get more
                i2c2_state = S_MASTER_RCV_DATA;
            }
            else
            {

                // Yes, it's the last byte.  Don't ack it
                // Flag that we will nak the data
                I2C_ACKNOWLEDGE_DATA_BIT = 1;

                I2C_FunctionComplete();
            }

            // Initiate the acknowledge
            I2C_ACKNOWLEDGE_ENABLE_BIT = 1;
            break;

        case S_MASTER_SEND_STOP:

            // Send the stop flag
            I2C_Stop(I2C_MESSAGE_COMPLETE);
            break;

        default:

            // This case should not happen, if it does then
            // terminate the transfer
            i2c2_object.i2cErrors++;
            I2C_Stop(I2C_LOST_STATE);
            break;

    }
    
    clearInterruptFlag(I2C1_Master_Event);
}

void I2C_FunctionComplete(void)
{

    // update the trb pointer
    p_i2c2_trb_current++;

    // are we done with this string of requests?
    if(--i2c2_trb_count == 0)
    {
        i2c2_state = S_MASTER_SEND_STOP;
    }
    else
    {
        i2c2_state = S_MASTER_RESTART;
    }

}

void I2C_Stop(I2C_MESSAGE_STATUS completion_code)
{
    // then send a stop
    I2C_STOP_CONDITION_ENABLE_BIT = 1;

    // make sure the flag pointer is not NULL
    if (p_i2c2_current->pTrFlag != NULL)
    {
        // update the flag with the completion code
        *(p_i2c2_current->pTrFlag) = completion_code;
    }

    // Done, back to idle
    i2c2_state = S_MASTER_IDLE;

}

void I2C_MasterWrite(
                                uint8_t *pdata,
                                uint32_t length,
                                uint16_t address,
                                I2C_MESSAGE_STATUS *pflag)
{
    static I2C_TRANSACTION_REQUEST_BLOCK   trBlock;

    // check if there is space in the queue
    if (i2c2_object.trStatus.s.full != true)
    {
        I2C_MasterWriteTRBBuild(&trBlock, pdata, length, address);
        I2C_MasterTRBInsert(1, &trBlock, pflag);
    }
    else
    {
        *pflag = I2C_MESSAGE_FAIL;
    }

}

void I2C_MasterRead(
                                uint8_t *pdata,
                                uint32_t length,
                                uint16_t address,
                                I2C_MESSAGE_STATUS *pflag)
{
    static I2C_TRANSACTION_REQUEST_BLOCK   trBlock;


    // check if there is space in the queue
    if (i2c2_object.trStatus.s.full != true)
    {
        I2C_MasterReadTRBBuild(&trBlock, pdata, length, address);
        I2C_MasterTRBInsert(1, &trBlock, pflag);
    }
    else
    {
        *pflag = I2C_MESSAGE_FAIL;
    }

}


inline void I2C_WaitForLastPacketToComplete()
{
    
    uint32_t timeout = 0xFFFFFFF;
    while(i2c2_state != S_MASTER_IDLE && timeout != 0)
    {
        // If your code gets stuck here it is because the last packet is never completing
        // Most likely cause is that your interrupt is not firing as it should. Check if you have
        //   correctly enabled all MSSP, Peripheral and GIE interrupt settings.
        timeout--;
        
    }
    
    if (timeout == 0) {
     
        error_handler.flags.i2c_stall = 1;
        clearInterruptFlag(I2C1_Master_Event);
        I2COnStateReset();
        I2C_Stop(I2C_MESSAGE_FAIL);
        
        
    }
}

void I2C_MasterTRBInsert(
                                uint32_t count,
                                I2C_TRANSACTION_REQUEST_BLOCK *ptrb_list,
                                I2C_MESSAGE_STATUS *pflag)
{

    // check if there is space in the queue
    if (i2c2_object.trStatus.s.full != true)
    {
        *pflag = I2C_MESSAGE_PENDING;

        i2c2_object.pTrTail->ptrb_list = ptrb_list;
        i2c2_object.pTrTail->count     = count;
        i2c2_object.pTrTail->pTrFlag   = pflag;
        i2c2_object.pTrTail++;

        // check if the end of the array is reached
        if (i2c2_object.pTrTail == (i2c2_tr_queue + I2C_CONFIG_TR_QUEUE_LENGTH))
        {
            // adjust to restart at the beginning of the array
            i2c2_object.pTrTail = i2c2_tr_queue;
        }

        // since we added one item to be processed, we know
        // it is not empty, so set the empty status to false
        i2c2_object.trStatus.s.empty = false;

        // check if full
        if (i2c2_object.pTrHead == i2c2_object.pTrTail)
        {
            // it is full, set the full status to true
            i2c2_object.trStatus.s.full = true;
        }

    }
    else
    {
        *pflag = I2C_MESSAGE_FAIL;
    }

    // for interrupt based
    if (*pflag == I2C_MESSAGE_PENDING)
    {
        I2C_WaitForLastPacketToComplete();

        // The state machine has to be started manually because it runs only in the ISR.
        // If we called the ISR function here function duplication would double the code size
        //    because this function would be called both from interrupt and from mainline code.
        setInterruptFlag(I2C1_Master_Event, 1);

    }   // block until request is complete

}

void I2C_MasterReadTRBBuild(
                                I2C_TRANSACTION_REQUEST_BLOCK *ptrb,
                                uint8_t *pdata,
                                uint32_t length,
                                uint16_t address)
{
    ptrb->address  = address << 1;
    // make this a read
    ptrb->address |= 0x01;
    ptrb->length   = length;
    ptrb->pbuffer  = pdata;
}

void I2C_MasterWriteTRBBuild(
                                I2C_TRANSACTION_REQUEST_BLOCK *ptrb,
                                uint8_t *pdata,
                                uint32_t length,
                                uint16_t address)
{
    ptrb->address = address << 1;
    ptrb->length  = length;
    ptrb->pbuffer = pdata;
}

bool I2C_MasterQueueIsEmpty(void)
{
    return(i2c2_object.trStatus.s.empty);
}

bool I2C_MasterQueueIsFull(void)
{
    return(i2c2_object.trStatus.s.full);
}        

void __ISR(_I2C1_BUS_VECTOR, IPL4SRS) I2C_BusCollisionISR( void )
{
    // enter bus collision handling code here
	clearInterruptFlag(I2C1_Bus_Collision_Event);
    error_handler.flags.i2c_bus_collision = 1;
} 

// this function returns if the temp I2C peripheral is currently turned on
uint32_t getI2COnState(void) {
 
    return I2C1CONbits.ON;
    
}

// this function resets Temp I2C on state, a workaround for errata
void I2COnStateReset(void) {
    
    
    // per Pic32MZ EF errata
    I2C1CONbits.ON = 0;
    
    Nop();
    Nop();
    Nop();
    Nop();
    Nop();
    
    I2C1CONbits.ON = 1;
    
}