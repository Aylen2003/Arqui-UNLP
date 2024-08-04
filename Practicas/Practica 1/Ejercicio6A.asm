# Multiplicación de números sin signo. Pasaje de parámetros a través de registros.
# El simulador no posee una instrucción para multiplicar números. Escribir un programa para multiplicar los números NUM1 y NUM2, y 
# guardar el resultado en la variable RES.

# Sin hacer llamados a subrutinas, resolviendo el problema desde el programa principal

     ORG 1000H
NUM1 DW 3h
NUM2 DW 2h
 RES DW ?

      ORG 2000H
      MOV DX , 0
      MOV AX, NUM1
      CMP AX, 0
      MOV CX, NUM2
LOOP: CMP CX, 0
      JZ FIN
      ADD DX, AX
      DEC CX
      JMP LOOP
 FIN: MOV RES, DX
      HLT
      END
