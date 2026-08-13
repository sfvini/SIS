% Sinais em Tempo Contínuo

% Definição do tempo contínuo e da função degrau unitário u(t)
t = -10:0.01:20;
u = @(t) t >= 0;

% Definição dos sinais
xa = @(t) u(t-5) - u(t-7);           % Pulso retangular unitário no intervalo [5, 7)
xb = @(t) u(t-5) + u(t-7);           % Degrau duplo: sobe para 1 em t=5 e para 2 em t=7
xc = @(t) (t.^2).*(u(t-1) - u(t-2)); % Trecho parabólico (t^2) limitado ao intervalo [1, 2)
xd = @(t) (t-4).*(u(t-2) - u(t-4)); % Rampa linear (t-4) no intervalo [2, 4)

% Plotagem
figure(1)
subplot(2,2,1); plot(t, xa(t)); grid on; title('x_a(t)'); axis([0 10 -1 3]);
subplot(2,2,2); plot(t, xb(t)); grid on; title('x_b(t)'); axis([0 10 -1 3]);
subplot(2,2,3); plot(t, xc(t)); grid on; title('x_c(t)'); axis([0 5 -1 5]);
subplot(2,2,4); plot(t, xd(t)); grid on; title('x_d(t)'); axis([0 5 -3 2]);



% Expressão Única vs. Definição por Partes

% Item (a): Sinal x1(t)
x1_partes = @(t) (4*t+4).*(u(t+1)-u(t)) + (-2*t+4).*(u(t)-u(t-2)); % Construção por trechos
x1_unico  = @(t) (4*t+4).*u(t+1) - 6*t.*u(t) + (2*t-4).*u(t-2);     % Expressão simplificada equivalente

% Item (b): Sinal x2(t)
x2_partes = @(t) (t.^2).*(u(t)-u(t-2)) + (2*t-8).*(u(t-2)-u(t-4)); % Construção por trechos
x2_unico  = @(t) t.^2.*u(t) - (t.^2-2*t+8).*u(t-2) - (2*t-8).*u(t-4);% Expressão simplificada equivalente

% Comparação gráfica
figure(2)
subplot(2,2,1); plot(t, x1_partes(t)); grid on; title('x_1(t) - Por Partes');       axis([-3 5 -2 5]);
subplot(2,2,2); plot(t, x1_unico(t));  grid on; title('x_1(t) - Expressão Única');  axis([-3 5 -2 5]);
subplot(2,2,3); plot(t, x2_partes(t)); grid on; title('x_2(t) - Por Partes');       axis([-1 5 -5 5]);
subplot(2,2,4); plot(t, x2_unico(t));  grid on; title('x_2(t) - Expressão Única');  axis([-1 5 -5 5]);



% Sinais em Tempo Discreto

% Definição do vetor discreto e da função degrau discreto u[n]
n = -10:20;
u_n = @(n) n >= 0;

% Definição dos sinais discretos
xa_n = @(n) u_n(n-2) - u_n(n-6);                         % Pulso discreto unitário em n = {2, 3, 4, 5}
xb_n = @(n) n.*(u_n(n) - u_n(n-7));                       % Rampa discreta (0 a 6)
xc_n = @(n) (n-2).*(u_n(n-2) - u_n(n-6));                % Rampa deslocada em n = {2, 3, 4, 5}
xd_n = @(n) (-n+8).*(u_n(n-6) - u_n(n-9));               % Rampa descendente em n = {6, 7, 8}
xe_n = @(n) xc_n(n) + xd_n(n);                           % Sinal composto triangulado (soma de xc e xd)

% Plotagem
figure(3)
subplot(3,2,1); stem(n, xa_n(n)); grid on; title('x_a[n]'); axis([-2 10 -1 2]);
subplot(3,2,2); stem(n, xb_n(n)); grid on; title('x_b[n]'); axis([-2 10 -1 8]);
subplot(3,2,3); stem(n, xc_n(n)); grid on; title('x_c[n]'); axis([-2 10 -1 5]);
subplot(3,2,4); stem(n, xd_n(n)); grid on; title('x_d[n]'); axis([-2 10 -1 4]);
subplot(3,2,5); stem(n, xe_n(n)); grid on; title('x_e[n]'); axis([-2 10 -1 5]);
