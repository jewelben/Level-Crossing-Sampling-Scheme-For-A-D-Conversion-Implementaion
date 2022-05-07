fsig = 32000;
time_grid = 0:1/fsig:2;
x = 4*cos(pi.*time_grid-pi/3)-2*sin(2*pi.*time_grid)+cos(10*pi.*time_grid+pi/6);
fs = 1;
n = -18:13;
Qlevels = (max(x)-min(x))/length(n).*n;
L = 10;
interp_order = 2;
fnq = 20;
t_out = 0:1/fnq:2;

for R = [128 512 8192]
    snr_vector = [];
    for DF = [1 2 4 8 16 32 64]
        mean = 0;
        for mm = 1:50
            y = ADC(x, Qlevels, L, R, fs,time_grid, interp_order, DF, fnq);
            z = interp1(t_out,y,time_grid,'spline');
            mean = mean + snr(x,z-x);
        end
        snr_vector = [snr_vector mean/50];
    end
        figure(1);
        plot([1 2 4 8 16 32 64],snr_vector,'-x');
        xticks([1 2 4 8 16 32 64]);
        xlim([0 66]);
        title("SNR vs DF for various values of R");
        xlabel("DF");
        ylabel("SNR (dB)");
        grid on;
        hold on;
end