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

n = 0.25;

c = zeros(1,65);
r = zeros(1,65);

for i = -32:32
    
    n = i./32; 
    k = find(abs(F_x-n) < 0.01);
    [val,idx]=min(abs(k-n));
    minIndex=k(idx);
    
    c(i+33) = F_x(minIndex);
    r(i+33) = xn(minIndex);
end


subplot(1,2,2);
stairs(r,c);
title('F_{\mu}(x) Codificada', 'Interpreter','tex');
grid on;
xlim([-1 1])
ylim([-1 1])


