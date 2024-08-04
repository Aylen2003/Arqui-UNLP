# Usando la subrutina ROTARIZQ_N del ejercicio anterior, escriba una subrutina ROTARDER_N que sea similar pero que realice N rotaciones hacia 
la derecha.
Una rotación a derecha de N posiciones, para un byte con 8 bits, se obtiene rotando a la izquierda 8 - N posiciones. Por ejemplo, al 
rotar a la derecha 6 veces el byte 10010100 se obtiene el byte 01010010, que es equivalente a la rotación a la izquierda de 2 posiciones 
del ejemplo anterior.

           ORG 1000H
         B DB 27H ; (00100111) EN BINARIO

           ORG 3000H
ROT_IZQ_N: MOV CH, 8
           SUB CH, BH  ; CANTIDAD DE BYTES
           MOV BH, CH ; VUELVO A COPIAR EN BH
          ; ROT_IZQ_N USARA EL VALOR ALMACENADO EN BH PARA ROTAR
          CALL ROT_IZQ_N
          RET

          ORG 2000H
          MOV AH, B
          ; REALIZAMOS UNA ROTACION DE 6 POSICIONES A LA DERECHA 
          MOV BH, 2
          CALL ROT_IZQ_N ; AH = 10011100 (C9H) 
