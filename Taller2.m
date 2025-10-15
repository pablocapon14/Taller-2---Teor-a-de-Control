%Pablo Capón
%Teoría de Control

num = 3;
den = [1 2 3];
ts = 0.1;
delay = 2;

%Podemos definir la Funcion de Transferencia en transformada de Laplace y
%en transformada, una para TC y otra para TD
Gs = tf(num,den,'InputDelay',delay);
Gz = tf(num,den,ts,'InputDelay',delay);

%% Respuesta al escalon y respuesta al impulso
%Definición de funciones de transferencia
[y,t]=step(Gs);
[y2, t2] = impulse(Gs);
%Puntos máximos
x2_point = 4.2376;
y2_point = 1.10841;
figure();
subplot(1,2,1);
plot(t,y,'LineWidth',1.6);
grid on;
title('Respuesta al escalón unitario');
hold on;
plot(x2_point,y2_point,'ro','MarkerSize',5,'MarkerFaceColor','r');
subplot(1,2,2)
plot(t2, y2,'LineWidth',1.7)
grid on;
title('Respuesta al impulso unitario');

%% Respuestas a señales arbitrarias

%Señal de la figura 2.2
%Definimos el dominio de la funcion
x_arb = 0:0.01:30;

%Definimos la funcion a trozos
y_arb = (x_arb >= 0 & x_arb < 10) .* 0 + ...
    (x_arb >= 10 & x_arb < 20).* 5 + ...
    (x_arb >= 20 & x_arb <= 30).* 10;

%Funcion de transferencia
[ytrans, xtrans] = lsim(Gs, y_arb, x_arb);
%Graficamos la funcion
figure();
plot(x_arb, y_arb,'LineStyle','--','LineWidth',1.2)
hold on
grid on;
plot(xtrans,ytrans,'r-','LineWidth',1.9);
title('Respuesta del sistema a la señal arbitraria(2.5.2.2)')
hold off;


%Senial arbitraria de la figura 2.3

%Definimos el dominio de la funcion
x_arb2 = 0:0.01:40;

%Definimos la funcion a trozos
y_arb2 = (x_arb2 >= 0 & x_arb2 < 10) .* 0 + ...
    (x_arb2 >= 10 & x_arb2 < 20).* 5 + ...
    (x_arb2 >= 20 & x_arb2 < 30).* (x_arb2-5) + ...
    (x_arb2 >= 30 & x_arb2 <= 40).* 25;
[ytr2, xtr2] = lsim(Gs, y_arb2, x_arb2);
%Graficamos la funcion
figure;
plot(x_arb2, y_arb2,'LineStyle','--','LineWidth',1.5','DisplayName','Señal arbitraria' );
hold on;
grid on;
%Evaluamos la funcion de transferencia
plot(xtr2,ytr2,'r-','LineWidth',1.8);
title('Respuesta del sistema a la señal arbitraria 2.3');
hold off;

%% Actividad reto
%Definimos el dominio de la funcion
x_arb3 = 0:0.01:50;

%Definimos la funcion a trozos
y_arb3 = (x_arb3 >= 0 & x_arb3 < 5) .* 0 + ...
    (x_arb3 >= 5 & x_arb3 < 15).* (x_arb3-5) + ...
    (x_arb3 >= 15 & x_arb3 < 20).* 10 + ...
    (x_arb3 >= 20 & x_arb3 < 25).* 15 + ... 
    (x_arb3 >= 25 & x_arb3 < 35).* (45 - x_arb3) + ...
    (x_arb3 >= 35 & x_arb3 < 45).* 5 + ...
    (x_arb3 >= 45 & x_arb3 <= 50).* 0;
[ytr3, xtr3] = lsim(Gs, y_arb3, x_arb3);
%Graficamos la funcion
figure;
subplot(2,1,1);
plot(x_arb3, y_arb3,'LineStyle','--','LineWidth',1.5)
grid on;
title('Senial arbitraria creada, Actividada Reto');
%hold on;
subplot(2,1,2);
plot(xtr3, ytr3,'LineWidth',1.5)
grid on;
hold on;
plot(x_arb3, y_arb3,'LineStyle','--','LineWidth',1.5)
title('Respuesta del sistema');
hold off;
