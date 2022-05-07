function y = ADC(x, Qlevels, L, R, fs,time_grid, interp_order, DF, fnq)

[a,at,~,~] = quantizer(x,Qlevels,L,R, fs,time_grid);
w = interpolator(at,a,interp_order,time_grid,DF*fnq);
y = decimator(w,DF);

end