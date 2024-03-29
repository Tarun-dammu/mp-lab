.MODEL SMALL

DISPLAY MACRO MSG
LEA DX,MSG
MOV AH,09H
INT 21H
ENDM

.DATA
TIMESTR DB 020H DUP(?)
MSG1 DB "CURRENT TIME ::$"

.CODE

START:MOV AX,@DATA
      MOV DS,AX

      MOV AH,00H
      MOV AL,03H
      INT 10H

AG: MOV BH,00H
    MOV DH,01H
    MOV DL,01H
    MOV AH,02H
    INT 10H

    MOV SI,OFFSET TIMESTR
    MOV AH,2CH
    INT 21H
    MOV AL,CH
    AAM
    ADD AX,3030H
    MOV [SI],AH
    INC SI
    MOV [SI],AL
    INC SI
    MOV [SI],BYTE PTR ':'
    INC SI

    MOV AL,CL
    AAM
    ADD AX,3030H
    MOV [SI],AH
    INC SI
    MOV [SI],AL
    INC SI
    MOV [SI],BYTE PTR ':'
    INC SI

    MOV AL,DH
    AAM
    ADD AX,3030H
    MOV [SI],AH
    INC SI
    MOV [SI],AL
    INC SI
    MOV [SI],BYTE PTR '$'
    INC SI

    DISPLAY MSG1
    DISPLAY TIMESTR

    MOV AH,0BH
    INT 21H
    CMP AL,00H
    JE AG

FINAL : MOV AH,4CH
        INT 21H

END START

