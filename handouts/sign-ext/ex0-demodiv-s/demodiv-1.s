! demodiv.s
! Divide each element in array and print.
! To be assebbled:
!       as88 demodiv.s print.s

    _EXIT	= 1     	! 1

.SECT .TEXT		        ! 2
start:      	    	! 3
    MOV     BX, a       ! 4  pointer to array element
    MOV     SI, 2       ! 5  divisor
    MOV     CX, end - a ! 6  compute array size
    SHR     CX, 1       ! 7

l1:
    MOV     AX, (BX)    ! 8
    PUSH    CX          !     save CX for a while
    MOV     CL, 15      ! 

    MOV     DX, AX      !     sign extend AX to DX:AX
    SAR     DX, CL      ! 
    
    IDIV    SI          ! 10
    POP     CX          !     restore CX
    MOV     (BX), AX    ! 11
    CALL    print       ! 12  printing (defined in print.s)
    ADD     BX, 2       ! 13
    LOOP    l1          ! 14


.SECT .DATA             ! 15
a:
    .WORD 8, -3, -6, 1  ! 16
end:
    .BYTE 0


.SECT .TEXT			! 17 exit...
    PUSH	0		! 18
    PUSH	_EXIT	! 19
    SYS			    ! 20


.SECT .BSS
