%% Secci�n 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo c�digo
close all
clear all
clc

%% Secci�n 2. Inicializaci�n
% Se definen las variables necesarias para el desarrollo del ejercicio, as�
% como las condiciones iniciales

syms s Ys t

y_0  = -1
y1_0 = 3

%% Secci�n 3. Desarrollo de la ecuaci�n
% y'' + 2*y' - 3*y = 0; y(0)=-1, y'(0)=3 / ejercicio a resolver

% Aplicando la propiedad de la transformada de una derivada y representando
% la transformada de y con la variable Ys obtenemos la ecuaci�n
% Nota: la ecuaci�n se despeja igualando a 0 para almacenar ambos lados de
% la igualdad en la misma variable

ecuacion_transformada = s^2*Ys        - s*y_0       - y1_0    +...
                        2*s*Ys        - 2*y_0       -...
                        3*Ys -...
                        0
%% Secci�n 4. Despeje de la transformada de la funci�n Y
% Se despeja la ecuaci�n obtenida en la secci�n anterior para obtener la
% transformada de laplace de la funci�n objetivo
Ys = solve(ecuacion_transformada,Ys)

%% Secci�n 5. Resoluci�n del ejercicio
% En matlab es posible calcular la transformada inversa directamente sobre
% la ecuaci�n despejada por medio del comando ilaplace como se muestra a
% continuaci�n:
Yt = ilaplace(Ys)