function y = decimator(x, DF)
    y = decimate(x,DF,'fir',10);
end