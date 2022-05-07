function [y, yt, Qlevels_witherror, Qerror] = quantizer_notimeerror(x, Qlevels, L, time_grid)

y = [];
yt = [];
Qerror = max(abs(x)).*2.^(-L-1);
Qlevels_witherror = Qlevels + Qerror.*(2.*rand(1,length(Qlevels))-1);

for nn = 1:length(x)-1
    for mm = 1:length(Qlevels)
        if (x(nn)<=Qlevels_witherror(mm) && x(nn+1)> Qlevels_witherror(mm))||(x(nn)>=Qlevels_witherror(mm) && x(nn+1)< Qlevels_witherror(mm))
            y = [y Qlevels(mm)];
            yt = [yt time_grid(nn)];
            if length(yt)>= 2 && yt(length(yt))==yt(length(yt)-1)
                y = y(1:length(y)-1);
                yt = yt(1:length(yt)-1);
            end
        end
    end
end
end