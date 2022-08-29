%% Secci�n 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo c�digo
close all
clear all
clc

%% Secci�n 2. Inicializaci�n
% Se utilizar� la variable simb�lica x para presentar el resultado de la
% representaci�n en fracciones parciales de la ecuaci�n
syms x A B;

% Definici�n de la ecuaci�n a presentar en fracciones parciales
f = (3*x + 1)/(x^2 + 4*x +3)
num = 3*x + 1 % numerador
den = x^2 + 4*x +3 % denominador

%% Factorizaci�n del denominador
% Se obtienen los t�rminos linales en los que es posible factorizar el denominador
factorizado = factor(den)

%% Definici�n de la ecuaci�n
% A continuaci�n se muestra la ecuaci�n obtenida, que al igualar la funci�n
% f a las fracciones parciales A/factorizado(1) + B/factorizado(2), de
% manera que se obtiene que el numerador es igual a la siguiente ecuaci�n:
ecuacion = expand(A*factorizado(1)) + expand(B*factorizado(2))

%% Separamos los t�rminos con y sin x de la ecuaci�n
% En este caso se hace de manera manual en una matriz para solucionar el
% sistema de ecuaciones, de manera que la primera fila son los coeficientes
% de los t�rminos con x y la segunda los t�rminos sin x
a = [1 1; 1 3]
b = [3; 1]
r = inv(a)*b; % Se resuelve el sistema de ecuaciones identificado
A = r(1)
B = r(2)

%% Presentaci�n de equivalente en fracciones parciales
f
Fraccion_parcial = A/factorizado(1) + B/factorizado(2)