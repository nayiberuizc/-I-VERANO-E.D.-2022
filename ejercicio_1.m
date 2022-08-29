%% Secci�n 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo c�digo
close all
clear all
clc

%% Secci�n 2. Inicializaci�n
% Se inicializan variables simb�licas, de manera que matlab las toma como
% letras al calcular los resultados de las ecuaciones
% Nota: cuando se coloca ";" al final de la l�nea el resultado no se
% muestra en la consola
syms p t;

% Se define la funci�n a transformar
F = t

% Para la referencia se obtiene primero la transformada por medio del
% comando directo de matlab, esta entrega el resultado utilizando la
% variable s por defecto
L_F_directa = laplace(F)

%% Secci�n 3. C�lculo manual de la transformada
% Se calcula la integral de la definici�n de la transformada, siguiendo el
% ejemplo en texto se utiliza en este caso la variable p
L_F_manual = int(F*exp(-p*t),t,0,inf)

%% Secci�n 4. Ajuste por rango de la funci�n
% Como se aprecia en la consola el c�lculo anterior es:
% - limit(exp(-p*t)*(p*t + 1), t, Inf)/p^2 + 1/p^2
% el cual se muestra definido como un l�mite cuando t tiende a infinito, 
% esto se debe a que la soluci�n de este l�mite est� definida por partes, 
% en funci�n del valor que tome p, sin embargo, dado el rango que nos
% interesa para el ejercicio (p>0, donde el l�mite es convergente), se 
% tiene 0 como resultado. Cosa que podemos comprobar ejecutando la primera 
% secci�n del l�mite y viendo la respuesta en el rango de inter�s.
limit(exp(-p*t),t,inf)
% Nota: La funci�n piecewise que se muestra en la ventana de comando como
% respuesta al l�mite define una respuesta por partes, indicando en pares
% el rango y el resultado, separado todo por comas.

% De manera que el resultado del primer t�rmino pasa a ser 0 al multiplicar
% este resultado por el resto del l�mite y la transformada pasa a ser:
L_F_manual = 1/p^2

%% Secci�n 5. Comparaci�n de resultados
% Vemos finalmente que pese a estar presentados con variables distintas la
% funci�n resultado obtenida es la misma que al ejecutar el comando
% directo, ya que este ya incluye las consideraciones expuestas en la
% secci�n anterior
L_F_manual
L_F