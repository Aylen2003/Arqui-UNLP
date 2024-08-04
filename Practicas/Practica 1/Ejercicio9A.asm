# Escribir una subrutina ROTARIZQ que haga una rotación hacia la izquierda de los bits de un byte almacenado en la memoria. Dicho byte debe 
pasarse por valor desde el programa principal a la subrutina a través de registros y por referencia. No hay valor de retorno, sino que se
modifica directamente la memoria.
Una rotación a izquierda de un byte se obtiene moviendo cada bit a la izquierda, salvo por el último que se mueve a la primera posición. Por 
ejemplo al rotar a la izquierda el byte 10010100 se obtiene 00101001, y al rotar a la izquierda 01101011 se obtiene 11010110.
Para rotar a la izquierda un byte, se puede multiplicar el número por 2, o lo que es lo mismo sumarlo a sí mismo. Por ejemplo (verificar):
    01101011
+   01101011
    11010110 (CARRY=0)
Entonces, la instrucción add ah, ah permite hacer una rotación a izquierda. No obstante, también hay que tener en cuenta que si el bit más significativo es un 1, el carry debe llevarse al bit menos significativo, es decir, se le debe sumar 1 al resultado de la primera suma.
   10010100
+  10010100
   00101000 (CARRY=1)
+  00000001
   00101001

         ORG 1000H
       B DB 27H  ; (00100111) EN BINARIO 

         ORG 3000H
ROT_IZQ: ADD AH, AH  ; RECIBE EL CARACTER A ROTAR EN AH
         ADD AH, 0   ; DEVUELVE EL RESULTADO TAMBIEN AH
         RET
         
         ORG 2000H
         MOV AH, B ; AH = 00100111
         ; REALIZAMOS UNA ROTACION
         CALL ROT_IZQ  ; AH = 01001110
         ; REALIZAMOS UNA SEGUNDA ROTACION
         CALL ROT_IZQ ; AH = 10011100
         HLT
         END
