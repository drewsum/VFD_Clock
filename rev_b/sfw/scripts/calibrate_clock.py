import serial
import time

# Assumes device is on COM4
dev = serial.Serial("COM9", 115200, timeout=1)

# Get unix time
unix_time = int(time.time())
print(unix_time)

# Assumes local timezone for US Central Time
if time.localtime().tm_isdst:
    local_offset = -5
else:
    local_offset = -6
print(local_offset)

# Pump out UTC with local offset to device
dev.write(b"Set RTCC: Unix Time: %d, %d\r\n" % (unix_time, local_offset))

dev.flush()

dev.close()
