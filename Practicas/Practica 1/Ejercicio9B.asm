# Usando la subrutina ROTARIZQ del ejercicio anterior, escriba una subrutina ROTARIZQ_N que realice N rotaciones a la izquierda de un byte. 
La forma de pasaje de parámetros es la misma, pero se agrega el parámetro N que se recibe por valor y registro. Por ejemplo, al rotar 
a la izquierda 2 veces el byte 10010100, se obtiene el byte 01010010.

         ORG 1000H
       B DB 27H  ;(00100111) EN BINARIO
; RECIBE EL CARACTER A ROTAR EN BH
; RECIBE LA CANTIDAD DE POSICIONES EN BH
; DEVUELVE EL RESULTADO TAMBIEN EN AH
         ORG 3000H
ROT_IZQ_N: CMP BH, 0 ;MINTRAS BH > 0
         JZ FIN  ; SI BH = 0 , ENTONCES FINALIZA LA SUBRUTINA
         CALL ROT_IZQ
         DEC BH
         JMP ROT_IZQ_N
    FIN: RET
         ORG 2000H
         MOV AH, B 
         ; REALIZAMOS UNA ROTACION DE 2 POSICIONES A LA IZQUIERDA
         MOV BH, 2
         CALL ROT_IZQ_N ; AH = 10011100 (C9H)
         HALT
         END
