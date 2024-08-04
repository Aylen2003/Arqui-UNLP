# Cálculo de A+B-C. Pasaje de parámetros a través de registros.
# En este ejercicio, programarás tus primeras subrutinas. Las subrutinas recibirán tres parámetros A, B y C, y realizarán un cálculo muy simple, 
# A+B-C, cuyo resultado deben retornar. Si bien en general no tendría sentido escribir una subrutina para una cuenta tan simple que puede 
# implementarse con dos instrucciones, esta simplificación permite concentrarse en los aspectos del pasaje de parámetros.

# Escribir un programa que dados los valores etiquetados como A, B y C y almacenados en la memoria de datos, calcule A+B-C y guarde 
# el resultado en la memoria con etiqueta D, sin utilizar subrutinas.

     ORG 1000H
num1 DW 2h
num2 DW 3h
num3 DW 4h
res  DW ?
     ORG 2000h
     mov ax, num1
     mov bx, num2
     mov cx, num3
     add ax, bx
     sub ax, cx
     mov res, ax
     hlt
     end 
