clear all; close all; clc;

t=0:1/1e7:0.0048;

% Señal x de t
x =20.*sin(1600.*pi.*t) + 2.*sin(2700.*pi.*t) + 0.15.*sin(5000.*pi.*t) + 0.003.*cos(1500.*pi.*t) + 0.01.*cos(6000.*pi.*t);

% Señal x de t normalizada
xn = x./abs(max(x));

u = 100;

% Comprimir
F_x = sign(xn).*((log(1+u.*abs(xn)))/(log(1+u)));


subplot(1,2,1);
plot(t,x);
title("Señal x(t)")
grid on;


subplot(1,2,2);
plot(t,xn);
title("Señal x(t) normalizada")
grid on;


figure(2)
subplot(1,2,1);
plot(xn,F_x);
title("F_{\mu}(x) Compresión", 'Interpreter','tex')
grid on;
xlim([-1 1])
ylim([-1 1])


[xn_c, Fx_c] = codificar(F_x,xn);

subplot(1,2,2);
stairs(xn_c,Fx_c);
title('F_{\mu}(x) Codificada', 'Interpreter','tex');
grid on;
xlim([-1 1])
ylim([-1 1])


