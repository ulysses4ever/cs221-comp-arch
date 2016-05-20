_PRINTF	= 127

.SECT .TEXT
print:
	PUSH AX
	PUSH format
	PUSH _PRINTF
	SYS
    ADD     SP, 6
	RET

.SECT .DATA
format: .ASCIZ "%d\n"

.SECT .BSS


