%% Sección 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo código
close all
clear all
clc

%% Sección 2. Inicialización
% Se utilizará la variable simbólica x para presentar el resultado de la
% representación en fracciones parciales de la ecuación
syms x A B;

% Definición de la ecuación a presentar en fracciones parciales
f = (3*x + 1)/(x^2 + 4*x +3)
num = 3*x + 1 % numerador
den = x^2 + 4*x +3 % denominador

%% Factorización del denominador
% Se obtienen los términos linales en los que es posible factorizar el denominador
factorizado = factor(den)

%% Definición de la ecuación
% A continuación se muestra la ecuación obtenida, que al igualar la función
% f a las fracciones parciales A/factorizado(1) + B/factorizado(2), de
% manera que se obtiene que el numerador es igual a la siguiente ecuación:
ecuacion = expand(A*factorizado(1)) + expand(B*factorizado(2))

%% Separamos los términos con y sin x de la ecuación
% En este caso se hace de manera manual en una matriz para solucionar el
% sistema de ecuaciones, de manera que la primera fila son los coeficientes
% de los términos con x y la segunda los términos sin x
a = [1 1; 1 3]
b = [3; 1]
r = inv(a)*b; % Se resuelve el sistema de ecuaciones identificado
A = r(1)
B = r(2)

%% Presentación de equivalente en fracciones parciales
f
Fraccion_parcial = A/factorizado(1) + B/factorizado(2)