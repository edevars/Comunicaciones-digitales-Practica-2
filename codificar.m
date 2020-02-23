function [r,c] = codificar(F_x, xn)
    c = zeros(1,65);
    r = zeros(1,65);
    
    for i = -32:32
        n = i./32; 
        k = find(abs(F_x-n) < 0.01);
        [~,idx]=min(abs(k-n));
        minIndex=k(idx);
        c(i+33) = F_x(minIndex);
        r(i+33) = xn(minIndex);
    end
end