# A) (-0,5)^n
clear all
n=1:10;
x = (-0.5).^n;
figure(2)
stem(n,x);
xlabel('n');
ylabel('x[n]');

# B) (2)^-n
clear all
n=1:10;
x = (2).^-n;
figure(3)
stem(n,x);
xlabel('n');
ylabel('x[n]');

# C) (-2)^n
clear all
n=1:10;
x = (-2).^n;
figure(4)
stem(n,x);
xlabel('n');
ylabel('x[n]');

# D) (e)^-2*t
clear all
t = 0:0.001:1;
x = exp(-2*t);
figure(5)
plot(t,x);
xlabel('n');
ylabel('x[n]');

# E) 2*cos(2*PI*50*t)
clear all
t = 0:0.001:0.1;
x = 2*cos(2*pi*50.*t);
figure(6)
plot(t,x);
xlabel('n');
ylabel('x[n]');
