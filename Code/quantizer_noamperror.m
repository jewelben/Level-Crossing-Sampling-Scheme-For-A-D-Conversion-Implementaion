function [y, yt, Qlevels_witherror, Qerror] = quantizer_noamperror(x, Qlevels, R, fs,time_grid)

y = [];
yt = [];
Qerror = 0;
Qlevels_witherror = Qlevels;
T = 1/(R*fs);

for nn = 1:length(x)-1
    for mm = 1:length(Qlevels)
        if (x(nn)<=Qlevels(mm) && x(nn+1)> Qlevels(mm))||(x(nn)>=Qlevels(mm) && x(nn+1)< Qlevels(mm))
            y = [y Qlevels(mm)];
            yt = [yt T*floor(time_grid(nn)/T)];
            if length(yt)>= 2 && yt(length(yt))==yt(length(yt)-1)
                y = y(1:length(y)-1);
                yt = yt(1:length(yt)-1);
            end
        end
    end
end
end