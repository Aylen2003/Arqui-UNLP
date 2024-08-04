# Multiplicación de números sin signo. Pasaje de parámetros a través de Pila.
# El programa de abajo utiliza una subrutina para multiplicar dos números, pasando los parámetros por valor para NUM1 y NUM2, y 
# por referencia (RES), en ambos casos a través de la pila. Analizar su contenido y contestar.
# 1. ¿Cuál es el modo de direccionamiento de la instrucción MOV AX, [BX]? ¿Qué se copia en el registro AX en este caso?
# 2. ¿Qué función cumple el registro temporal ri que aparece al ejecutarse una instrucción como la anterior?
# 3. ¿Qué se guarda en AX al ejecutarse MOV AX, OFFSET RES?
# 4. ¿Cómo se pasa la variable RES a la pila, por valor o por referencia? ¿Qué ventaja tiene esto?
# 5. ¿Cómo trabajan las instrucciones PUSH y POP?

      ORG 3000H  ; Subrutina MUL
MUL:  PUSH BX    ; preservar registros
      PUSH CX
      PUSH AX
      PUSH DX
      MOV BX, SP
      ADD BX, 12     ; corrección por el IP(2), RES(2) y los 4 registros(8)
      MOV CX, [BX]   ; cx = num2
      ADD BX, 2      ; bx apunta a num1
      MOV AX, [BX]   ; ax = num1
      SUB BX, 4      ; bx apunta a la dir de resultado guardado 
      MOV BX, [BX]  
      MOV DX, 0
SUMA: ADD DX, AX
      DEC CX
      JNZ SUMA
      MOV [BX], DX  ; guardar resultado
      POP DX  ;restaurar registros
      POP AX
      POP CX
      POP BX
      RET
      
      ORG 1000H ; Memoria de datos
 NUM1 DW 5H
 NUM2 DW 3H
  RES DW ?

      ORG 2000H; Prog principal
      ; parámetros
      MOV AX, NUM1
      PUSH AX
      MOV AX, NUM2
      PUSH AX
      MOV AX, OFFSET RES
      PUSH AX
      CALL MUL
      ; desapilar parámetros
      POP AX
      POP AX
      POP AX
      HLT
      END

# 1. El modo de direccionamiento de la instruccion MOV AX, [BX] es indirecto (de registro). En este caso en AX se copia 5. 
# 2. El resgistro RI es utilizado en el modo de direccionamiento, cumple una funcion similar al IP y SP, en el modo de direccionamiento directo 
cuando se le pasa el nombre de la variable, lo que hace RI es almacenar en el la direccion de memoria que corresponde a esa variable y luego 
que termina de cargar la direccion en la que se encuentra la variable  se utiliza ese registro para posicionarte en la direccion almacenada en 
el registro RI y ahí comienza a cargar los datos de esa direccion en el registro destino. Tambien se utiliza cuando se llama a un a subrutina, 
en RI se almacena la direccion de la subrutina y luego que es cargada en le registro se mueve esa direccion al IP. Y luego que es cargada en el 
registro posionamiento en memoria. 
# 3. Lo que se guarda en AX, es la direccion 1004H. Tras ejecutarse la instrucción MOV AX, OFFSET RES
# 4.El pasaje de la variable RES a la pila es por referencia. La ventaja que tiene es que son mas flexibles(pasar vectores, listas, etc) y 
tenemos acceso a memoria. 
# 5.La operacion PUSH (apilar) añade un nuevo elemento en la cabecera de la pila y la operacion POP (desapilar) elimina el elemento de la
cabecera de la pila.
