%% Sección 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo código
close all
clear all
clc

%% Sección 2. Inicialización
% Se inicializan variables simbólicas, de manera que matlab las toma como
% letras al calcular los resultados de las ecuaciones
% Nota: cuando se coloca ";" al final de la línea el resultado no se
% muestra en la consola
syms p t;

% Se define la función a transformar
F = t

% Para la referencia se obtiene primero la transformada por medio del
% comando directo de matlab, esta entrega el resultado utilizando la
% variable s por defecto
L_F_directa = laplace(F)

%% Sección 3. Cálculo manual de la transformada
% Se calcula la integral de la definición de la transformada, siguiendo el
% ejemplo en texto se utiliza en este caso la variable p
L_F_manual = int(F*exp(-p*t),t,0,inf)

%% Sección 4. Ajuste por rango de la función
% Como se aprecia en la consola el cálculo anterior es:
% - limit(exp(-p*t)*(p*t + 1), t, Inf)/p^2 + 1/p^2
% el cual se muestra definido como un límite cuando t tiende a infinito, 
% esto se debe a que la solución de este límite está definida por partes, 
% en función del valor que tome p, sin embargo, dado el rango que nos
% interesa para el ejercicio (p>0, donde el límite es convergente), se 
% tiene 0 como resultado. Cosa que podemos comprobar ejecutando la primera 
% sección del límite y viendo la respuesta en el rango de interés.
limit(exp(-p*t),t,inf)
% Nota: La función piecewise que se muestra en la ventana de comando como
% respuesta al límite define una respuesta por partes, indicando en pares
% el rango y el resultado, separado todo por comas.

% De manera que el resultado del primer término pasa a ser 0 al multiplicar
% este resultado por el resto del límite y la transformada pasa a ser:
L_F_manual = 1/p^2

%% Sección 5. Comparación de resultados
% Vemos finalmente que pese a estar presentados con variables distintas la
% función resultado obtenida es la misma que al ejecutar el comando
% directo, ya que este ya incluye las consideraciones expuestas en la
% sección anterior
L_F_manual
L_F