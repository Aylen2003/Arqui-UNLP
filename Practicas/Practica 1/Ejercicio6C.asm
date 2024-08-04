# Llamando a una subrutina MUL, pasando los parámetros por referencia desde el programa principal a través de registros, y devolviendo el 
# resultado a través de un registro por valor

     ORG 1000H
NUM1 DW 3h
NUM2 DW 2H
 RES DW ?

      ORG 3000H
MULT: MOV DX, 0
      MOV BX, AX
      MOV AX, [BX]
      MOV BX, CX
      MOV CX, [BX]
      CMP CX, 0
      JZ FIN
LAZO: ADD DX, AX
      DEC CX
      JNZ LAZO
 FIN: RET

      ORG 2000H
      MOV AX, OFFSET NUM1
      MOV CX, OFFSET NUM2
      CALL MULT
      HLT
      END
