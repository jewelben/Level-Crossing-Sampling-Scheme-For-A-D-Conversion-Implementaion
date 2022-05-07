fsig = 32000;
time_grid = 0:1/fsig:2;
x = 4*cos(pi.*time_grid-pi/3)-2*sin(2*pi.*time_grid)+cos(10*pi.*time_grid+pi/6);

n = -37:26;
Qlevels = (max(x)-min(x))/length(n).*n;
L = 8;
fnq = 20;
t_out = 0:1/fnq:2;
DF = 16;

for R = [256 1024 8192]
    snr_vector = [];
    for interp_order = [1 2 3]
        mean = 0;
        for mm = 1:100
            y = ADC(x, Qlevels, L, R, time_grid, interp_order, DF, fnq);
            z = interp1(t_out,y,time_grid,'spline');
            mean = mean + snr(x,z-x);
        end
        snr_vector = [snr_vector mean/100];
    end
        figure(1);
        plot([1 2 3],snr_vector,'-x');
        xticks([1 2 3]);
        xlim([0.9 3.1]);
        ylim([24 32]);
        title("SNR vs interpolation order for various values of R");
        xlabel("Interpolation order");
        ylabel("SNR (dB)");
        grid on;
        hold on;
end