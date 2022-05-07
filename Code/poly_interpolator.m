function v = poly_interpolator(t_samples,y,order,t_fine)
v = [];
ts = t_fine(2)-t_fine(1);
n = length(y);
    for nn = 1:order:n
        
        Y = y(nn:min(nn+order,n));
        T = t_samples(nn:min(nn+order,n));
        if nn >= n-order
            tt = t_fine((length(v)+1:length(t_fine)));
        else
            tt = t_fine(length(v)+1):ts:max(T)-ts;
        end
        v = [v polyinterp(T,Y,tt)];
        if nn >= n-order
            break;
        end
    end

end