fsig = 32000;
time_grid = 0:1/fsig:2;
x = 4*cos(pi.*time_grid-pi/3)-2*sin(2*pi.*time_grid)+cos(10*pi.*time_grid+pi/6);

n = -19:12;
Qlevels = (max(x)-min(x))/length(n).*n;
L = 8;
R = 8000;
interp_order = 1;
f = 200;

t_out = 0:1/f:2;

[y,yt,~,~] = quantizer(x, Qlevels, L, R, time_grid);
w = poly_interpolator(yt,y,interp_order,t_out);

figure(1);
subplot(2,1,1);
plot(time_grid,x);
subplot(2,1,2);
plot(t_out,w,'r');