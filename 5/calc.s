.text
.global Start_DSP
.global Arr3

Start_DSP:
    MOVE 2, R0.L
    MOVE 2, R2.L
    MOVE Arr1, A1
    MOVE Arr2, A2
    MOVE Arr3, A3
    MOVE 4, IT
    MOVE 0, R8.L
    MOVE 0, R6.l

    DO 32, L1
    MOVE R0.L, (A1)+
    MOVE R2.L, (A2)+
L1: NOP

    MOVE (Arr1), A1
    MOVE (Arr2), A2

    MOVE A2.L, R0.L
    Move R0.L, AT.L
    MOVE (A1)+, R2.L
    MOVE (AT)+IT, R0.L
    MPYl R2.L, R0.L, R6.d

    DO 4, L2
        DO 8, L3
            MOVE 0, R8.l
            MOVE A2.L, R0.L
            Move R0.L, AT.L
            MOVE (AT)+IT, R0.l
            DO 8, L4
                  MPYl R2.L, R0.L, R6.D ADDl R6.l, R8.l (A1)+,R2.L (AT)+IT,R0.L
            L4: NOP
            MOVE R8.L, (A3)+
        L3: NOP
    L2: NOP
    STOP

.data
Arr1: .space 128, 0x00
Arr2: .space 128, 0x00
Arr3: .space 64, 0x00
.end
