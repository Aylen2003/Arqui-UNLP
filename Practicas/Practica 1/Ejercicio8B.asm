# Escribir una subrutina CONTAR_MIN que cuente el número de letras minúsculas de la ‘a’ a la ‘z’ de una cadena de caracteres 
terminada en cero almacenada en la memoria. La cadena se pasa a la subrutina por referencia vía registro, y el resultado se retorna por 
valor también a través de un registro.
Ejemplo: CONTAR_MIN de ‘aBcDE1#!’ debe retornar 2.

       ORG 1000H
CADENA DB "Hola < como estas"
   FIN DB 0

       ORG 2000H
       MOV BX, OFFSET CADENA
 LOOP: MOV AL, [BX] ; TOMO CARACTER ACTUAL
       CMP AL, 0
       JZ FIN_PROGRAMA
       CMP AL, 61h   ; SI ES MENOR A "a" DA SIGNO 
       JS SIGUE
       CMP 7BH, AL   ; SI ES MAYOR QUE "a" DA SIGNO 
       JS SIGUE
       ; SI LLEGA ACA ES PORQUE ES MINUSCULA 
       INC RESULTADO
SIGUE: INC BX ; AVANZO AL SIGUIENTE CARACTER
       JMP LOOP
FIN_PROGRAMA: HLT
              END
