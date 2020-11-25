/*******************************************************************************
  Inter-Integrated Circuit (I2C) Library
  Source File

  Company:
    Microchip Technology Inc.

  File Name:
    plib_i2c5.c

  Summary:
    I2C PLIB Implementation file

  Description:
    This file defines the interface to the I2C peripheral library.
    This library provides access to and control of the associated peripheral
    instance.

*******************************************************************************/
// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018-2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "plib_i2c.h"
#include "32mz_interrupt_control.h"
#include <xc.h>

#include <stdio.h>

#include "terminal_control.h"
#include "error_handler.h"

// These are macros needed for defining ISRs, included in XC52
#include <sys/attribs.h>

// *****************************************************************************
// *****************************************************************************
// Section: Global Data
// *****************************************************************************
// *****************************************************************************


void I2CMaster_Initialize(void)
{
    /* Disable the I2C Master interrupt */
    IEC5CLR = _IEC5_I2C5MIE_MASK;

    /* Disable the I2C Bus collision interrupt */
    IEC5CLR = _IEC5_I2C5BIE_MASK;

    I2C5BRG = 0x04A;

    I2C5CONCLR = _I2C5CON_SIDL_MASK;
    I2C5CONCLR = _I2C5CON_DISSLW_MASK;
    I2C5CONCLR = _I2C5CON_SMEN_MASK;

    setInterruptPriority(I2C5_Bus_Collision_Event, 4);
    setInterruptPriority(I2C5_Master_Event, 7);
    
    /* Clear master interrupt flag */
    IFS5CLR = _IFS5_I2C5MIF_MASK;

    /* Clear fault interrupt flag */
    IFS5CLR = _IFS5_I2C5BIF_MASK;

    /* Turn on the I2C module */
    I2C5CONSET = _I2C5CON_ON_MASK;

    /* Set the initial state of the I2C state machine */
    i2c5Obj.state = I2C_STATE_IDLE;
}

/* I2C state machine */
static void I2CMaster_TransferSM(void)
{
    IFS5CLR = _IFS5_I2C5MIF_MASK;

    switch (i2c5Obj.state)
    {
        case I2C_STATE_START_CONDITION:
            /* Generate Start Condition */
            I2C5CONSET = _I2C5CON_SEN_MASK;
            IEC5SET = _IEC5_I2C5MIE_MASK;
            IEC5SET = _IEC5_I2C5BIE_MASK;
            i2c5Obj.state = I2C_STATE_ADDR_BYTE_1_SEND;
            break;

        case I2C_STATE_ADDR_BYTE_1_SEND:
            /* Is transmit buffer full? */
            if (!(I2C5STAT & _I2C5STAT_TBF_MASK))
            {
                if (i2c5Obj.address > 0x007F)
                {
                    /* Transmit the MSB 2 bits of the 10-bit slave address, with R/W = 0 */
                    I2C5TRN = ( 0xF0 | (((uint8_t*)&i2c5Obj.address)[1] << 1));

                    i2c5Obj.state = I2C_STATE_ADDR_BYTE_2_SEND;
                }
                else
                {
                    /* 8-bit addressing mode */
                    I2C5TRN = ((i2c5Obj.address << 1) | i2c5Obj.transferType);

                    if (i2c5Obj.transferType == I2C_TRANSFER_TYPE_WRITE)
                    {
                        i2c5Obj.state = I2C_STATE_WRITE;
                    }
                    else
                    {
                        i2c5Obj.state = I2C_STATE_READ;
                    }
                }
            }
            break;

        case I2C_STATE_ADDR_BYTE_2_SEND:
            /* Transmit the 2nd byte of the 10-bit slave address */
            if (!(I2C5STAT & _I2C5STAT_ACKSTAT_MASK))
            {
                if (!(I2C5STAT & _I2C5STAT_TBF_MASK))
                {
                    /* Transmit the remaining 8-bits of the 10-bit address */
                    I2C5TRN = i2c5Obj.address;

                    if (i2c5Obj.transferType == I2C_TRANSFER_TYPE_WRITE)
                    {
                        i2c5Obj.state = I2C_STATE_WRITE;
                    }
                    else
                    {
                        i2c5Obj.state = I2C_STATE_READ_10BIT_MODE;
                    }
                }
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c5Obj.error = I2C_ERROR_NACK;
                I2C5CONSET = _I2C5CON_PEN_MASK;
                i2c5Obj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_READ_10BIT_MODE:
            if (!(I2C5STAT & _I2C5STAT_ACKSTAT_MASK))
            {
                /* Generate repeated start condition */
                I2C5CONSET = _I2C5CON_RSEN_MASK;
                i2c5Obj.state = I2C_STATE_ADDR_BYTE_1_SEND_10BIT_ONLY;
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c5Obj.error = I2C_ERROR_NACK;
                I2C5CONSET = _I2C5CON_PEN_MASK;
                i2c5Obj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_ADDR_BYTE_1_SEND_10BIT_ONLY:
            /* Is transmit buffer full? */
            if (!(I2C5STAT & _I2C5STAT_TBF_MASK))
            {
                /* Transmit the first byte of the 10-bit slave address, with R/W = 1 */
                I2C5TRN = ( 0xF1 | ((((uint8_t*)&i2c5Obj.address)[1] << 1)));
                i2c5Obj.state = I2C_STATE_READ;
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c5Obj.error = I2C_ERROR_NACK;
                I2C5CONSET = _I2C5CON_PEN_MASK;
                i2c5Obj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_WRITE:
            if (!(I2C5STAT & _I2C5STAT_ACKSTAT_MASK))
            {
                /* ACK received */
                if (i2c5Obj.writeCount < i2c5Obj.writeSize)
                {
                    if (!(I2C5STAT & _I2C5STAT_TBF_MASK))
                    {
                        /* Transmit the data from writeBuffer[] */
                        I2C5TRN = i2c5Obj.writeBuffer[i2c5Obj.writeCount++];
                    }
                }
                else
                {
                    if (i2c5Obj.readCount < i2c5Obj.readSize)
                    {
                        /* Generate repeated start condition */
                        I2C5CONSET = _I2C5CON_RSEN_MASK;

                        i2c5Obj.transferType = I2C_TRANSFER_TYPE_READ;

                        if (i2c5Obj.address > 0x007F)
                        {
                            /* Send the I2C slave address with R/W = 1 */
                            i2c5Obj.state = I2C_STATE_ADDR_BYTE_1_SEND_10BIT_ONLY;
                        }
                        else
                        {
                            /* Send the I2C slave address with R/W = 1 */
                            i2c5Obj.state = I2C_STATE_ADDR_BYTE_1_SEND;
                        }

                    }
                    else
                    {
                        /* Transfer Complete. Generate Stop Condition */
                        I2C5CONSET = _I2C5CON_PEN_MASK;
                        i2c5Obj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
                    }
                }
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c5Obj.error = I2C_ERROR_NACK;
                I2C5CONSET = _I2C5CON_PEN_MASK;
                i2c5Obj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_READ:
            if (!(I2C5STAT & _I2C5STAT_ACKSTAT_MASK))
            {
                /* Slave ACK'd the device address. Enable receiver. */
                I2C5CONSET = _I2C5CON_RCEN_MASK;
                i2c5Obj.state = I2C_STATE_READ_BYTE;
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c5Obj.error = I2C_ERROR_NACK;
                I2C5CONSET = _I2C5CON_PEN_MASK;
                i2c5Obj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_READ_BYTE:
            /* Data received from the slave */
            if (I2C5STAT & _I2C5STAT_RBF_MASK)
            {
                i2c5Obj.readBuffer[i2c5Obj.readCount++] = I2C5RCV;
                if (i2c5Obj.readCount == i2c5Obj.readSize)
                {
                    /* Send NAK */
                    I2C5CONSET = _I2C5CON_ACKDT_MASK;
                    I2C5CONSET = _I2C5CON_ACKEN_MASK;
                }
                else
                {
                    /* Send ACK */
                    I2C5CONCLR = _I2C5CON_ACKDT_MASK;
                    I2C5CONSET = _I2C5CON_ACKEN_MASK;
                }
                i2c5Obj.state = I2C_STATE_WAIT_ACK_COMPLETE;
            }
            break;

        case I2C_STATE_WAIT_ACK_COMPLETE:
            /* ACK or NAK sent to the I2C slave */
            if (i2c5Obj.readCount < i2c5Obj.readSize)
            {
                /* Enable receiver */
                I2C5CONSET = _I2C5CON_RCEN_MASK;
                i2c5Obj.state = I2C_STATE_READ_BYTE;
            }
            else
            {
                /* Generate Stop Condition */
                I2C5CONSET = _I2C5CON_PEN_MASK;
                i2c5Obj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_WAIT_STOP_CONDITION_COMPLETE:
            i2c5Obj.state = I2C_STATE_IDLE;
            IEC5CLR = _IEC5_I2C5MIE_MASK;
            IEC5CLR = _IEC5_I2C5BIE_MASK;
            if (i2c5Obj.callback != NULL)
            {
                i2c5Obj.callback(i2c5Obj.context);
            }
            break;

        default:
            break;
    }
}


void I2CMaster_CallbackRegister(I2C_CALLBACK callback, uintptr_t contextHandle)
{
    if (callback == NULL)
    {
        return;
    }

    i2c5Obj.callback = callback;
    i2c5Obj.context = contextHandle;
}

bool I2CMaster_IsBusy(void)
{
    if( (i2c5Obj.state != I2C_STATE_IDLE ) || (I2C5CON & 0x0000001F) ||
        (I2C5STAT & _I2C5STAT_TRSTAT_MASK) || (I2C5STAT & _I2C5STAT_S_MASK) )
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool I2CMaster_Read(uint16_t address, uint8_t* rdata, size_t rlength)
{
    /* State machine must be idle and I2C module should not have detected a start bit on the bus */
    if((i2c5Obj.state != I2C_STATE_IDLE) || (I2C5STAT & _I2C5STAT_S_MASK))
    {
        return false;
    }

    i2c5Obj.address             = address;
    i2c5Obj.readBuffer          = rdata;
    i2c5Obj.readSize            = rlength;
    i2c5Obj.writeBuffer         = NULL;
    i2c5Obj.writeSize           = 0;
    i2c5Obj.writeCount          = 0;
    i2c5Obj.readCount           = 0;
    i2c5Obj.transferType        = I2C_TRANSFER_TYPE_READ;
    i2c5Obj.error               = I2C_ERROR_NONE;
    i2c5Obj.state               = I2C_STATE_ADDR_BYTE_1_SEND;

    I2C5CONSET                  = _I2C5CON_SEN_MASK;
    IEC5SET                     = _IEC5_I2C5MIE_MASK;
    IEC5SET                     = _IEC5_I2C5BIE_MASK;

    return true;
}


bool I2CMaster_Write(uint16_t address, uint8_t* wdata, size_t wlength)
{
    /* State machine must be idle and I2C module should not have detected a start bit on the bus */
    if((i2c5Obj.state != I2C_STATE_IDLE) || (I2C5STAT & _I2C5STAT_S_MASK))
    {
        return false;
    }

    i2c5Obj.address             = address;
    i2c5Obj.readBuffer          = NULL;
    i2c5Obj.readSize            = 0;
    i2c5Obj.writeBuffer         = wdata;
    i2c5Obj.writeSize           = wlength;
    i2c5Obj.writeCount          = 0;
    i2c5Obj.readCount           = 0;
    i2c5Obj.transferType        = I2C_TRANSFER_TYPE_WRITE;
    i2c5Obj.error               = I2C_ERROR_NONE;
    i2c5Obj.state               = I2C_STATE_ADDR_BYTE_1_SEND;

    I2C5CONSET                  = _I2C5CON_SEN_MASK;
    IEC5SET                     = _IEC5_I2C5MIE_MASK;
    IEC5SET                     = _IEC5_I2C5BIE_MASK;

    return true;
}


bool I2CMaster_WriteRead(uint16_t address, uint8_t* wdata, size_t wlength, uint8_t* rdata, size_t rlength)
{
    /* State machine must be idle and I2C module should not have detected a start bit on the bus */
    if((i2c5Obj.state != I2C_STATE_IDLE) || (I2C5STAT & _I2C5STAT_S_MASK))
    {
        return false;
    }

    i2c5Obj.address             = address;
    i2c5Obj.readBuffer          = rdata;
    i2c5Obj.readSize            = rlength;
    i2c5Obj.writeBuffer         = wdata;
    i2c5Obj.writeSize           = wlength;
    i2c5Obj.writeCount          = 0;
    i2c5Obj.readCount           = 0;
    i2c5Obj.transferType        = I2C_TRANSFER_TYPE_WRITE;
    i2c5Obj.error               = I2C_ERROR_NONE;
    i2c5Obj.state               = I2C_STATE_ADDR_BYTE_1_SEND;

    I2C5CONSET                  = _I2C5CON_SEN_MASK;
    IEC5SET                     = _IEC5_I2C5MIE_MASK;
    IEC5SET                     = _IEC5_I2C5BIE_MASK;

    return true;
}

I2C_ERROR I2CMaster_ErrorGet(void)
{
    I2C_ERROR error;

    error = i2c5Obj.error;
    i2c5Obj.error = I2C_ERROR_NONE;

    return error;
}

bool I2CMaster_TransferSetup(I2C_TRANSFER_SETUP* setup, uint32_t srcClkFreq )
{
    uint32_t baudValue;
    uint32_t i2cClkSpeed;

    if (setup == NULL)
    {
        return false;
    }

    i2cClkSpeed = setup->clkSpeed;

    /* Maximum I2C clock speed cannot be greater than 1 MHz */
    if (i2cClkSpeed > 1000000)
    {
        return false;
    }

    if( srcClkFreq == 0)
    {
        srcClkFreq = 6666666UL;
    }

    baudValue = ((float)((float)srcClkFreq/2.0) * (1/(float)i2cClkSpeed - 0.000000150)) - 1;

    /* I2CxBRG value cannot be from 0 to 5 or more than the size of the baud rate register */
    if ((baudValue < 4) || (baudValue > 65555))
    {
        return false;
    }

    I2C5BRG = baudValue;

    /* Enable slew rate for 400 kHz clock speed; disable for all other speeds */

    if (i2cClkSpeed == 400000)
    {
        I2C5CONCLR = _I2C5CON_DISSLW_MASK;;
    }
    else
    {
        I2C5CONSET = _I2C5CON_DISSLW_MASK;;
    }

    return true;
}

void __ISR(_I2C5_BUS_VECTOR, IPL4SRS) I2CMaster_BUS_InterruptHandler( void )
{
    
    /* Clear the bus collision error status bit */
    I2C5STATCLR = _I2C5STAT_BCL_MASK;

    /* ACK the bus interrupt */
    IFS5CLR = _IFS5_I2C5BIF_MASK;

    i2c5Obj.state = I2C_STATE_IDLE;

    i2c5Obj.error = I2C_ERROR_BUS_COLLISION;

    if (i2c5Obj.callback != NULL)
    {
        i2c5Obj.callback(i2c5Obj.context);
    }
    
    // enter bus collision handling code here
	clearInterruptFlag(I2C5_Bus_Collision_Event);
    // error_handler.flags.i2c_bus_collision = 1;
} 

void __ISR(_I2C5_MASTER_VECTOR, IPL7SRS) I2C_MASTER_ISR ( void )
{
    I2CMaster_TransferSM();
}

// this function prints out status about the I2C module used in master mode
void printI2CMasterStatus(void) {
    
    // print I2CXCON bitfield
    if (I2C5CONbits.ON) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    I2C Master Module is %s\n\r", I2C5CONbits.ON ? "enabled" : "disabled");
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    I2C SDA hold time set to %s\n\r", I2C5CONbits.SDAHT ? "500ns" : "100ns");
    
    if (I2C5CONbits.SIDL) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    I2C Master Module %s in Idle Mode\n\r", I2C5CONbits.SIDL ? "Disabled" : "Enabled");
    
    if (I2C5CONbits.STRICT) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Strict address enforcement is %s\n\r", I2C5CONbits.STRICT ? "enabled" : "disabled");
    
    if (I2C5CONbits.A10M) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    10 bit addressing is %s\n\r", I2C5CONbits.A10M ? "enabled" : "disabled");
    
    if (I2C5CONbits.DISSLW) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Drive strength slew rate control is %s\n\r", I2C5CONbits.DISSLW ? "disabled" : "enabled");
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    I/O logic thresholds set to %s levels\n\r", I2C5CONbits.SMEN ? "SMBus" : "I2C");
    printf("    Next acknowledge sequence is a data %s\n\r", I2C5CONbits.ACKDT ? "NACK" : "ACK");
    
    if (I2C5CONbits.ACKEN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Acknowledge sequence is currently %s\n\r", I2C5CONbits.ACKEN ? "Enabled" : "Disabled");
    
    if (I2C5CONbits.RCEN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Master is currently %s\n\r", I2C5CONbits.RCEN ? "reading" : "writing");
    
    if (I2C5CONbits.PEN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Stop condition is currently %s\n\r", I2C5CONbits.PEN ? "enabled" : "disabled");
    
    if (I2C5CONbits.RSEN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Repeated start condition is %s\n\r", I2C5CONbits.RSEN ? "in progress" : "not in progress");
    
    if (I2C5CONbits.SEN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Start condition is currently %s\n\r", I2C5CONbits.SEN ? "in progress" : "not in progress");
    
    // Print out bitfield for I2CXSTAT register
    if (I2C5STATbits.ACKSTAT) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    %s received from slave\n\r", I2C5STATbits.ACKSTAT ? "NACK" : "ACK");
    
    if (I2C5STATbits.TRSTAT) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Master transmit is currently %s\n\r", I2C5STATbits.TRSTAT ? "in progress" : "not in progress");
    
    if (I2C5STATbits.BCL) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Bus collision %s\n\r", I2C5STATbits.BCL ? "detected" : "not detected");
    
    if (I2C5STATbits.ADD10) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    10 bit address %s\n\r", I2C5STATbits.ADD10 ? "matched" : "not matched");
    
    if (I2C5STATbits.IWCOL) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Write collision has %s\n\r", I2C5STATbits.IWCOL ? "occurred" : "not occurred");
    
    if (I2C5STATbits.I2COV) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Receive overflow has %s\n\r", I2C5STATbits.I2COV ? "occurred" : "not occurred");
    
    if (I2C5STATbits.P) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Stop bit was %s\n\r", I2C5STATbits.P ? "detected" : "not detected");
    
    if (I2C5STATbits.S) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Start or repeated start %s\n\r", I2C5STATbits.S ? "detected" : "not detected");
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Master is currently %s\n\r", I2C5STATbits.R_W ? "reading" : "writing");
    
    if (I2C5STATbits.RBF) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Receive buffer is currently %s\n\r", I2C5STATbits.RBF ? "full" : "empty");
    
    if (I2C5STATbits.TBF) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Transmit buffer is currently %s\n\r", I2C5STATbits.TBF ? "full" : "empty");
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    I2C Baud Rate Generator is set to 0x%04X\r\n", I2C5BRG);
    printf("    Current transmit buffer contents: 0x%02X\r\n", I2C5TRN);
    printf("    Current receive buffer contents: 0x%02X\r\n", I2C5RCV);
    
    terminalTextAttributesReset();
    
}