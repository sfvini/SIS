% TEMPO CONTÍNUO

% Definição do vetor do tempo e função degrau unitário
t = -10:0.01:10;
u = @(t) t >= 0;

% Sinal base contínuo assimétrico x(t)
x_tc = @(t) (t+1).*(u(t+1)-u(t)) + 2*(u(t)-u(t-1));

% --- Figura 1: Transformações Temporais ---
figure(1)
subplot(5,1,1); plot(t, x_tc(t));       title('Original: x(t)');                 axis([-5 5 -1 3]);
subplot(5,1,2); plot(t, x_tc(t-1));     title('Atraso: x(t-1)');                 axis([-5 5 -1 3]);
subplot(5,1,3); plot(t, x_tc(-t+2));    title('Inversão e Deslocamento: x(-t+2)'); axis([-5 5 -1 3]);
subplot(5,1,4); plot(t, x_tc(2*t+1));   title('Compressão Temporal: x(2t+1)');   axis([-5 5 -1 3]);
subplot(5,1,5); plot(t, x_tc(-t/2+4));  title('Expansão e Inversão: x(-t/2+4)'); axis([-5 5 -1 3]);

% --- Figura 2: Decomposição Par e Ímpar ---
xp_tc = @(t) (x_tc(t) + x_tc(-t)) / 2; % Parte Par
xi_tc = @(t) (x_tc(t) - x_tc(-t)) / 2; % Parte Ímpar

figure(2)
subplot(4,1,1); plot(t, x_tc(t));    title('Sinal Original x(t)'); axis([-4 4 -1 3]);
subplot(4,1,2); plot(t, x_tc(-t));   title('Sinal Invertido x(-t)'); axis([-4 4 -1 3]);
subplot(4,1,3); plot(t, xp_tc(t));   title('Parte Par x_p(t)');    axis([-4 4 -1 3]);
subplot(4,1,4); plot(t, xi_tc(t));   title('Parte Ímpar x_i(t)');  axis([-4 4 -2 2]);


% TEMPO DISCRETO

% Definição do vetor discreto e impulso unitário
n = -10:10;
imp = @(n) (n == 0);

% Sinal base discreto x[n]
x_td = @(n) imp(n-1) + 2*imp(n-2) + 3*imp(n-3) + 2*imp(n-4) + imp(n-5);

% --- Figura 3: Transformações Temporais ---
figure(3)
subplot(5,1,1); stem(n, x_td(n));     title('Original: x[n]');                 axis([-10 10 -1 4]);
subplot(5,1,2); stem(n, x_td(n-2));   title('Atraso: x[n-2]');                 axis([-10 10 -1 4]);
subplot(5,1,3); stem(n, x_td(-n+3));  title('Inversão e Deslocamento: x[-n+3]'); axis([-10 10 -1 4]);
subplot(5,1,4); stem(n, x_td(3*n));   title('Subamostragem/Decimação: x[3n]'); axis([-10 10 -1 4]);
subplot(5,1,5); stem(n, x_td(n/3));   title('Expansão: x[n/3]');               axis([-10 10 -1 4]);

% --- Figura 4: Decomposição Par e Ímpar ---
xp_td = @(n) (x_td(n) + x_td(-n)) / 2; % Parte Par Discreta
xi_td = @(n) (x_td(n) - x_td(-n)) / 2; % Parte Ímpar Discreta

figure(4)
subplot(4,1,1); stem(n, x_td(n));    title('Sinal Original x[n]'); axis([-8 8 -1 4]);
subplot(4,1,2); stem(n, x_td(-n));   title('Sinal Invertido x[-n]'); axis([-8 8 -1 4]);
subplot(4,1,3); stem(n, xp_td(n));   title('Parte Par x_p[n]');    axis([-8 8 -1 4]);
subplot(4,1,4); stem(n, xi_td(n));   title('Parte Ímpar x_i[n]');  axis([-8 8 -2 2]);
