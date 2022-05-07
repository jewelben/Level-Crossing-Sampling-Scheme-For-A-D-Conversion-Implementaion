Qlevels = [-3 -2.2 -1 -0.3 1.2 2.8 3.4 4.3];
fsig = 10000;
time_grid = 0:1/fsig:1;
fs = 1;
L = 3;
x = 3*sin(3*pi*time_grid)-2*cos(2*pi*time_grid+pi/3)-1.5*sin(10*pi*time_grid+pi/4);
R = 100; 

[a, at] = levelcrossingsampling(x,Qlevels,time_grid);
[b,bt,~,~] = quantizer_noamperror(x, Qlevels, R, fs,time_grid);
[c,ct,~,~] = quantizer_notimeerror(x, Qlevels,L,time_grid);
[d,dt,~,~] = quantizer(x, Qlevels,L, R, fs, time_grid);

figure(1);
plot(time_grid,x);
hold on;
stem(at,a);
hold off;
ylim([-4 6]);
xlabel("t",'interpreter','latex');
title("\bf{Level-Crossing Sampling Scheme}",'interpreter','latex');
legend("Original signal x(t)","Sampled signal",'interpreter','latex');
set(gcf,'position',[10,10,700,400]);

figure(2);
plot(time_grid,x);
hold on;
stem(bt,b);
hold off;
ylim([-4 6]);
xlabel("t",'interpreter','latex');
title("\bf{Sampled signal with no ampltitude uncertainty but with time uncertainty of 0.01s}",'interpreter','latex');
legend("Original signal x(t)","Sampled signal",'interpreter','latex');
set(gcf,'position',[10,10,700,400]);

figure(3);
plot(time_grid,x);
hold on;
stem(ct,c);
hold off;
ylim([-4 6]);
xlabel("t",'interpreter','latex');
title("\bf{Sampled signal with no time uncertainty but with amplitude uncertainty of $\delta_a$ = 0.3088}",'interpreter','latex');
legend("Original signal x(t)","Sampled signal",'interpreter','latex');
set(gcf,'position',[10,10,700,400]);

figure(4);
plot(time_grid,x);
hold on;
stem(dt,d);
hold off;
ylim([-4 6]);
xlabel("t",'interpreter','latex');
title("\bf{Sampled signal with time uncertainty of 0.01s and amplitude uncertainty of $\delta_a$ = 0.3088}",'interpreter','latex');
legend("Original signal x(t)","Sampled signal",'interpreter','latex');
set(gcf,'position',[10,10,700,400]);