fsig = 50000;
time_grid = 0:1/fsig:2;
fs = 1;
x = 3*sin(5*pi*time_grid)-2*cos(2*pi*time_grid+pi/3);
n = -15:16;
Qlevels = (max(x)-min(x))/length(n).*n;
for L = [7 8 9 10 11 12]
   
    snr_vector = [];
    R_vector = [];
  
    for nn = 1:8
        mean = 0;
        R_vector = [R_vector 2.^(nn+7)];
        for mm = 1:50
            [y,yt,~,~] = quantizer(x, Qlevels, L, R_vector(nn), fs,time_grid);
            z = interp1(yt,y,time_grid,'spline');
            mean = mean + snr(x,z-x);
        end
        snr_vector = [snr_vector (mean/50)];
    end
    
    figure(1);
    hold on;
    plot(R_vector,snr_vector,'-x');
    xlabel("R");
    ylabel("SNR (dB)");
    title("SNR vs R for various values of L");
    grid on;
    set(gcf,'position',[10,10,600,500]);
    
end