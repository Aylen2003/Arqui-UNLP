# SWAP Escribir una subrutina SWAP que intercambie dos datos de 16 bits almacenados en memoria. Los parámetros deben ser pasados por 
referencia desde el programa principal a través de la pila.
Para hacer este ejercicio, tener en cuenta que los parámetros que se pasan por la pila son las direcciones de memoria, por lo tanto para acceder 
a los datos a intercambiar se requieren accesos indirectos, además de los que ya se deben realizar para acceder a los parámetros de la pila.

      ORG 1000H
 NUM1 DW 3
 NUM2 DW 2

      ORG 3000H
SWAP: PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX
      MOV BX, SP
      ;Tomar Dir NUM1
      ADD BX, 12
      MOV AX,[BX]

      ;Tomar Dir NUM2
      SUB BX, 2
      MOV CX, [BX]

      ;Tomar Valor NUM1
      MOV BX, AX
      MOV AX, [BX]
      MOV DX, BX  ;GUARDAMOS DIR NUM1

      ;Tomar Valor NUM2
      MOV BX, CX
      MOV CX, [BX]

      ;Insertar Valor de Num1 en Dir Num2
      MOV [BX], AX

      ;Insertar Valor de Num1 en Dir Num2
      MOV BX, DX
      MOV [BX], CX

      POP DX
      POP CX
      POP BX
      POP AX
      RET

      ORG 2000H
      ;Inicializamos AX y BX
      MOV AX,OFFSET NUM1
      PUSH AX
      MOV AX,OFFSET NUM2
      PUSH AX
      CALL SWAP
      HLT   
      END
