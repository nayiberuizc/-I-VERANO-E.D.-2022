%% Sección 1. Comandos de cabecera
% limpian los comandos previos y la memoria de variables para evitar conflictos al ejecutar un nuevo código
close all
clear all
clc

%% Sección 2. Inicialización
% Se definen las variables necesarias para el desarrollo del ejercicio, así
% como las condiciones iniciales

syms s Ys t

y_0  = 1
y1_0 = 5

%% Sección 3. Desarrollo de la ecuación
% y'' - 3*y' + 2*y = e^(-4*t); y(0)=1, y'(0)=5 / ejercicio a resolver

% Aplicando la propiedad de la transformada de una derivada y representando
% la transformada de y con la variable Ys obtenemos la ecuación
% Nota: la ecuación se despeja igualando a 0 para almacenar ambos lados de
% la igualdad en la misma variable

ecuacion_transformada = s^2*Ys        - s*y_0       - y1_0    -...
                        3*s*Ys        + 3*y_0       +...
                        2*Ys -...
                        laplace(exp(-4*t))
%% Sección 4. Despeje de la transformada de la función Y
% Se despeja la ecuación obtenida en la sección anterior para obtener la
% transformada de laplace de la función objetivo
Ys = solve(ecuacion_transformada,Ys)

%% Sección 5. Resolución del ejercicio
% En matlab es posible calcular la transformada inversa directamente sobre
% la ecuación despejada por medio del comando ilaplace como se muestra a
% continuación:
% Nota: Dada la forma y extensión de la transformada de laplace de Y se hace
% necesario utilizar fracciones parciales para simplificar el cálculo de la
% transformada inversa, sin embargo este proceso es innecesario al emplear
% el comando directo en matlab. Es importante sin embargo tener claro este
% concepto para entender como se llega al resultado de manera manual.
Yt = ilaplace(Ys)