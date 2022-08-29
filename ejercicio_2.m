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

% Se define la funci�n base
F = sin(2*t)

% Se calcula la funci�n a transformar, en este caso la segunda derivada,
% que se obtiene con el comando diff
dF = diff(F)
d2F = diff(F,2)

% Para la referencia se obtiene primero la transformada por medio del
% comando directo de matlab, esta entrega el resultado utilizando la
% variable s por defecto
L_d2F_directa = laplace(d2F)

%% Secci�n 3. Calculo de la transformada por medio de la propiedad de transformada de una derivada
% *L{f ? (t)} = p*F (p) ? f (0)
% *L{f ?? (t)} = p^2*F (p) ? p*f (0) ? f ?0
% Nota: por simplicidad para las condiciones iniciales se har� la escritura
% directa, as� se evita buscar alternativas m�s avanzadas para la
% manupulaci�n de funciones
L_d2F_propiedad = p^2 * laplace(F) - p * sin(2*0) - 2*cos(2*0)

%% Secci�n 4. Comparaci�n de resultados
% En este caso obtenemos por medio de la propiedad una expresi�n
% equivalente, que puede ser llevada a la forma m�nima que nos entrega la
% funci�n directa al realizar la suma de fracciones que obtenemos
L_d2F_directa
L_d2F_propiedad