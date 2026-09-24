t = -10:0.01:10;
T = 4;
omega = 2 * pi/T;
t1 = 1;
x = 2*t1/T;

for i = 1:100
    x = x + (((sin(iomegat1))/pi/i) - (exp(-j * i * omega * 2))(sin(iomegat1)/pi/i)*exp(jiomegat)) + (((sin((-i)omegat1))/pi/(-i)) - (exp(-j * (-i) * omega * 2))(sin((-i)*omegat1)/pi/(-i))exp(j(-i)omegat));
end

plot(t,x)
