# Llamando a una subrutina MUL para efectuar la operación, pasando los parámetros por valor desde el programa principal a 
# través de registros y devolviendo el resultado a través de un registro por valor.

     ORG 1000H
NUM1 DW 3h
NUM2 DW 2h
 RES DW ?

      ORG 3000H
MULT: CMP CX, 0
      JZ FIN
LAZO: ADD AX, CX
      DEC DX
      JNZ LAZO
 FIN: RET

      ORG 2000H
      MOV CX, NUM1 
      MOV DX, NUM2
      CALL MULT
      MOV RES, AX
      HLT  
      END
