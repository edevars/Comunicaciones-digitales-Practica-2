clear all; close all; clc;

t=0:1/1e8:0.0048;

% Señal x(t)
x =20.*sin(1600.*pi.*t) + 2.*sin(2700.*pi.*t) + 0.15.*sin(5000.*pi.*t) + 0.003.*cos(1500.*pi.*t) + 0.01.*cos(6000.*pi.*t);

% Señal x(t) normalizada
xn = x./abs(max(x));

% Valor de Mu
u = 100;

% Comprimir
F_x = sign(xn).*((log(1+u.*abs(xn)))/(log(1+u)));

% Grafica de x(t)
subplot(1,2,1);
plot(t,x);
title("Señal x(t)")
grid on;

% Grafica de x(t) normalizada
subplot(1,2,2);
plot(t,xn);
title("Señal x(t) normalizada")
grid on;


figure(2)

% Grafica de F(x) que muestra la compresion

plot(xn,F_x);
title("F_{\mu}(x) Compresión", 'Interpreter','tex')
grid on;
xlim([-1 1])
ylim([-1 1])


% Codificando F(x)
[xn_c, Fx_c, dicc] = codificar(F_x,xn);

% Grafica de Fx(t) codificada

figure(3)
stairs(xn_c,Fx_c);
title('F_{\mu}(x) Codificada', 'Interpreter','tex');
grid on;
xlim([-1 1])
ylim([-1 1])
hold on

plot([-1 1],[Fx_c(1) Fx_c(1)],'k')
plot(xn_c(1),Fx_c(1),'ro')

plot([-1 1],[Fx_c(8) Fx_c(8)],'k')
plot(xn_c(8),Fx_c(8),'ro')

plot([-1 1],[Fx_c(16) Fx_c(16)],'k')
plot(xn_c(16),Fx_c(16),'ro')

plot([-1 1],[Fx_c(24) Fx_c(24)],'k')
plot(xn_c(24),Fx_c(24),'ro')

plot([-1 1],[0 0],'b')


plot([-1 1],[Fx_c(40) Fx_c(40)],'k')
plot(xn_c(40),Fx_c(40),'ro')

plot([-1 1],[Fx_c(48) Fx_c(48)],'k')
plot(xn_c(48),Fx_c(48),'ro')

plot([-1 1],[Fx_c(56) Fx_c(56)],'k')
plot(xn_c(56),Fx_c(56),'ro')

plot([-1 1],[Fx_c(64) Fx_c(64)],'k')
plot(xn_c(64),Fx_c(64),'ro')


figure(4)

% Calculo de F(y), proceso de expansion

F_y = sign(F_x).*(1/u).*((1+u).^abs(F_x) - 1);


% Grafica de F(y)
plot(F_x,F_y);
title("F_{\mu}^{-1}(y) Expansión", 'Interpreter','tex')
grid on;
xlim([-1 1])
ylim([-1 1])

figure(5)

% Grafica de x(t) para comparacion
subplot(1,2,1);
plot(t,x);
title("Señal x(t)")
grid on;

% Multiplicacion de F_y por X(t)
x_t = F_y.*abs(max(x));

subplot(1,2,2);
plot(t,x_t);
title("F_{\mu}^{-1}(y) multiplicada por |X(t)|_{max}", 'Interpreter','tex')
grid on;





