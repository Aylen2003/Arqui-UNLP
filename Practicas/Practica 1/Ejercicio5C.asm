# Volver a escribir el programa, pero ahora con una subrutina que reciba A, B y C por valor a través de los registros AX, BX y CX, 
# calcule AX+BX-CX, y devuelva el resultado por valor en el registro DX. El programa principal debe llamar a la subrutina y luego guardar 
# el resultado en la memoria con etiqueta D. 

     ORG 1000H
num1 DW 2h
num2 DW 3h
num3 DW 4h
res  DW ?

         ORG 30000H
CALCULO: mov dx, ax  ;le asigno a DX el valor que esta dentro de AX
         add dx, bx
         sub dx, cx
         ret

         ORG 2000H
         mov ax, num1
         mov bx, num2
         mov cx, num3
         call CALCULO
         mov res, dx
         hlt
         end
