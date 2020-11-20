.MODEL SMALL

DISP MACRO MSG
LEA DX,MSG
MOV AH,09H
INT 21H
ENDM

.DATA
MSG1 DB 0DH,0AH,"ENTER THE FILE NAME FOR CREATION..$"
MSG2 DB 0DH,0AH,"FILE CREATED SUCCESSFULLY..$"
MSG3 DB 0DH,0AH,"CREATION FAILED..$"
MSG4 DB 0DH,0AH,"ENTER THE FILE NAME FOR DELETION..$"
MSG5 DB 0DH,0AH,"FILE DELETED SUCCESSFULLY..$"
MSG6 DB 0DH,0AH,"DELETION FAILED..$"
FNAME1 DB 10 DUP(0)
FNAME2 DB 10 DUP(0)


.CODE
MOV AX,@DATA
MOV DS,AX
DISP MSG1
MOV SI,00

BACK1:MOV AH,01H
      INT 21H
      CMP AL,0DH
      JE NEXT1
      MOV FNAME1[SI],AL
      INC SI
      JMP BACK1

NEXT1:MOV FNAME1[SI],'$'
      LEA DX,FNAME1
      MOV CX,00
      MOV AH,3CH
      INT 21H
      JC  CFAIL
      DISP MSG2
      JMP DEL

CFAIL:DISP MSG3

DEL:DISP MSG4
    MOV SI,00

BACK2:MOV AH,01H
      INT 21H
      CMP AL,0DH
      JE NEXT2
      MOV FNAME2[SI],AL
      INC SI
      JMP BACK2

NEXT2:MOV FNAME2[SI],'$'
      LEA DX,FNAME2
      MOV AH,41H
      INT 21H
      JC DFAIL
      DISP MSG5
      JMP LAST

DFAIL:DISP MSG6

LAST: MOV AH,4CH
      INT 21H
END


