fsig = 5000;
time_grid = 0:1/fsig:2;
fs = 1;
x = 3*sin(5*pi*time_grid)-2*cos(2*pi*time_grid+pi/3);
DF = 5;
Nq = 25;
R = 2048;
interp_order = [1 2 3 4];

for pow = [3 5 7 9]
    n = -2^pow+1:2^pow;
    Qlevels = (max(x)-min(x))/length(n).*n;
    snr_vector = [];
    mean = 0;
    for tt = 1:4
        
        for mm = 1:50
            [y,yt,~,~] = quantizer_noamperror(x, Qlevels, R, fs,time_grid);
            z = poly_interpolator(yt,y,interp_order(tt),time_grid);
            mean = mean + snr(x,z-x);
            
        end
        snr_vector = [snr_vector (mean/50)];
    end
    
    figure(1);
    hold on;
    plot(interp_order,snr_vector,'-o');
    xlabel("Interpolation order");
    ylabel("SNR (dB)");
    xticks([1 2 3 4]);
    xlim([0.9 4.1]);
    title("SNR vs interpolation order for various number of quantization levels");
    grid on;
    set(gcf,'position',[10,10,600,500]);
    
end

