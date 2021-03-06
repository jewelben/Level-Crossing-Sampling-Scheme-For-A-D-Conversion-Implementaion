fsig = 32000;
time_grid = 0:1/fsig:2;
fs = 1;
x = 4*cos(pi.*time_grid-pi/3)-2*sin(2*pi.*time_grid)+cos(10*pi.*time_grid+pi/6);

n = -18:13;
Qlevels = (max(x)-min(x))/length(n).*n;

L = 8;
R = 2048;
interp_order = 2;
DF = 16;
fnq = 20;
fout = DF*fnq;
t_out = 0:1/fnq:2;

[v,vt,~,~] = quantizer(x,Qlevels,L,R,fs, time_grid);
w = interpolator(vt,v,interp_order,time_grid,fout);
y = ADC(x, Qlevels, L, R, fs, time_grid, interp_order, DF, fnq);
figure(1);
subplot(3,1,1);
plot(time_grid,x);
hold on;
stem(vt,v);
hold off;
ylim([-7 5]);
title("Quantizer output");
legend("Input signal to ADC","Output");
grid on;
subplot(3,1,2);
plot(time_grid,x);
hold on;
stem(0:1/fout:2,w);
hold off;
ylim([-7 5]);
title("Interpolator output");
legend("Input signal to ADC","Output");
grid on;
subplot(3,1,3);
plot(time_grid,x);
hold on;
stem(t_out,y);
hold off;
ylim([-7 5]);
title("Decimator output / ADC output");
legend("Input signal to ADC","Output");
grid on;

z = interp1(t_out,y,time_grid,'spline');
disp(snr(x,z-x));