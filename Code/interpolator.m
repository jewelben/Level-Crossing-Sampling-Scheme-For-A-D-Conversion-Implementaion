function w = interpolator(t_samples,y,order,t_fine,fout)
    v = poly_interpolator(t_samples,y,order,t_fine);
    v = v + 0.05*max(abs(v))*randn(size(v)); %noise
    F = 1/(t_fine(2)-t_fine(1));
    w = v(1:F/fout:length(v));
end