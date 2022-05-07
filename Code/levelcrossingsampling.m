function [y, yt] = levelcrossingsampling(x, Qlevels, time_grid)

y = [];
yt = [];

for nn = 1:length(x)-1
    for mm = 1:length(Qlevels)
        if (x(nn)<=Qlevels(mm) && x(nn+1)> Qlevels(mm))||(x(nn)>=Qlevels(mm) && x(nn+1)< Qlevels(mm))
            y = [y Qlevels(mm)];
            yt = [yt time_grid(nn)];
        end
    end
end
end