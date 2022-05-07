[x,fsig]=audioread("sample1.wav");
fs = 6000;
time_grid = 0:1/fsig:5;
x = x(1:length(time_grid));
n = -255:256;
Qlevels = (max(x)-min(x))/length(n).*n;
L = 14;
R = 4096;
interp_order = 2;
DF = 16;
fnq = 8000;
fout = DF*fnq;
t_out = 0:1/fnq:5;

y = ADC(x, Qlevels, L, R, fs,time_grid, interp_order, DF, fnq);

disp(snr(x',y-x'));