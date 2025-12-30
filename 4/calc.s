.text
.global Start_DSP
.global Arr3

Start_DSP:
    MOVE 1, R0.L
    MOVE 1, R1.L
    MOVE 1, R2.L
    MOVE 1, R3.L
    MOVE Arr1, A1
    MOVE Arr2, A2
    MOVE Arr3, A3
    MOVE 4, I4
    MOVE 0, R8.L
    MOVE 0, R9.L

    DO 16, L1
    MOVE R0.D, (A1)+
    MOVE R2.D, (A2)+
L1: NOP

    MOVE (Arr1), A1
    MOVE (Arr2), A2

    DO 2, L2
        DO 4, L3
            MOVE 0, R12.L
            MOVE 0, R8.L
            MOVE 0, R9.L
            MOVE A2.l, R0.l
            Move R0.l, A4.l
            DO 4, L4
                MOVE (A1)+, R2.d
                MOVE (A4)+I4, R4.d
                ML2 R2.d, R4.d, R6.q
                MOVE R7.d, R10.d
                MOVE r10.L, R7.l
                ALL2 R6.d,R8.d,R8.d
                ADDL R8.L, R9.L, R12.l
            L4: NOP
            MOVE R12.l, (A3)+
        L3: NOP
    L2: NOP
    STOP

.data
Arr1: .space 128, 0x00
Arr2: .space 128, 0x00
Arr3: .space 64, 0x00
.end
