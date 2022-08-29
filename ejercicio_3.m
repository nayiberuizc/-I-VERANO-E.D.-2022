%% Secci�n 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo c�digo
close all
clear all
clc

%% Secci�n 2. Inicializaci�n
% Se utilizar� la variable simb�lica x para presentar el resultado de la
% representaci�n en fracciones parciales de la ecuaci�n
syms x;

f = (5*x - 3)/((x+1)*(x-3))
% Para este procedimiento se requiere presentar el cociente a separar en
% vectores que contienen los coeficientes del numerador y el denominador en
% potencias descendientes de x, para lo cual necesitamos operar el
% denominador propuesto en el ejercicio (x+1)*(x-3) = x^2 - 2x - 3x^0,
% obteniendo los coeficientes 1, -2 y -3
num = [5, -3]
den = [1, -2, -3]

%% Obtenci�n de las fracciones
% Se utiliza la funci�n residue para obtener los t�rminos directos de las
% fracciones parciales, los cuales se almacenan en un vector como se
% muestra en la l�nea de c�digo:
[numeradores, denominadores, terminos_independientes] = residue(num,den)

%% Interpretaci�n del resultado
% Para interpretar los vectores resultantes tenemos que tomar en grupos los
% valores de los vectores, de la siguiente manera:
fracciones = numeradores(1)/(x - denominadores(1)) + numeradores(2)/(x - denominadores(2))
% Que viene a ser el equivalente en fracciones parciales de la funci�n
% original
% Nota: esta ecuaci�n genera solo dos t�rminos en las fracciones parciales,
% en caso de ser m�s se repite la estructura utilizada con los dem�s
% t�rminos
f