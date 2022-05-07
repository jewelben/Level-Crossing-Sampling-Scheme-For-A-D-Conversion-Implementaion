function y = polyinterp(t_samples,x,t_fine)
y = zeros(size(t_fine));
for k = 1:length(t_samples)
    w = ones(size(t_fine));
    for j = 1:length(t_samples)
        if j~=k
            w = (t_fine-t_samples(j))./(t_samples(k)-t_samples(j)).*w;
        end
    end
    y = y + w.*x(k);
end