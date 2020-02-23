function [r,c, dicc] = codificar(F_x, xn)
    c = zeros(64,1);
    r = zeros(64,1);
    j = 0;
    
    for i = -32:32
        if i ~= 0
            j=j+1;
            n = i./32;
            
            b1 = "";
            b2 = "";
            b3 = "";
            
            % Codificacion del bit de nivel
            if i >= 1
                b1 = "1";
            else
                b1 = "0";
            end
            
            s = ceil(abs(i)/8);
           
            
            if s == 1
                b2 = "00";
            elseif s == 2
                b2 = "01";
            elseif s == 3
                b2 = "10";
            else 
                b2 = "11";
            end
            
            numDec = abs(i) - s.*8 + 7; 
            
            b3 = dec2bin(numDec,3);
            
            
            
            k = find(abs(F_x-n) < 0.01);
            [~,idx]=min(abs(k-n));
            minIndex=k(idx);
            c(j) = F_x(minIndex);
            r(j) = xn(minIndex);
            dicc(j) = strcat(b1,b2,b3);
        end
    end
end