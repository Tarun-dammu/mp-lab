.model small
.data
a db 10h,20h,30h,40h,50h
b db 11h,22h,33h,44h,55h
.code
mov ax,@data
mov ds,ax
lea si,a
lea di,b
mov cl,05h
;loop definition
back:mov al,[si]
xchg al,[di]
mov [si],al
inc si
inc di
loop back
;to verify the output
lea si,a
lea di,b
mov bl,[si]
mov bh,[di]
mov ah,4ch
int 21h
end
