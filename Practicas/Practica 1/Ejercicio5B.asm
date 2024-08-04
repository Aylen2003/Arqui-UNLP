# Escribir un programa como en a) pero ahora el cálculo y el almacenamiento del resultado debe realizarse en una subrutina llamada calculo, 
# sin recibir ni devolver parámetros, es decir, utilizando A, B, C y D como variables globales. Si 
# bien esta técnica no está recomendada, en ejercicio sirve para ver sus diferencias con el uso de parámetros.

     ORG 1000H
num1 DW 2h
num2 DW 3h
num3 DW 4h
res  DW ?
         ORG 30000H
CALCULO: mov ax, num1
         mov bx, num2
         mov cx, num3
         add ax, bx
         sub ax, cx
         mov res, ax 
         ret

         ORG 2000H
         call CALCULO
         hlt
         end
