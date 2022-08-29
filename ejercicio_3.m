%% Sección 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo código
close all
clear all
clc

%% Sección 2. Inicialización
% Se utilizará la variable simbólica x para presentar el resultado de la
% representación en fracciones parciales de la ecuación
syms x;

f = (5*x - 3)/((x+1)*(x-3))
% Para este procedimiento se requiere presentar el cociente a separar en
% vectores que contienen los coeficientes del numerador y el denominador en
% potencias descendientes de x, para lo cual necesitamos operar el
% denominador propuesto en el ejercicio (x+1)*(x-3) = x^2 - 2x - 3x^0,
% obteniendo los coeficientes 1, -2 y -3
num = [5, -3]
den = [1, -2, -3]

%% Obtención de las fracciones
% Se utiliza la función residue para obtener los términos directos de las
% fracciones parciales, los cuales se almacenan en un vector como se
% muestra en la línea de código:
[numeradores, denominadores, terminos_independientes] = residue(num,den)

%% Interpretación del resultado
% Para interpretar los vectores resultantes tenemos que tomar en grupos los
% valores de los vectores, de la siguiente manera:
fracciones = numeradores(1)/(x - denominadores(1)) + numeradores(2)/(x - denominadores(2))
% Que viene a ser el equivalente en fracciones parciales de la función
% original
% Nota: esta ecuación genera solo dos términos en las fracciones parciales,
% en caso de ser más se repite la estructura utilizada con los demás
% términos
f