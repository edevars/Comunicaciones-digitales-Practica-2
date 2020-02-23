function [xn_c,Fx_c, dicc] = codificar(F_x, xn)
    
    xn_c = zeros(64,1);
    Fx_c = zeros(64,1);
    j = 0;
    
    for i = -32:32
        if i ~= 0
            j=j+1;
            n = i./32;
            
            
            % Codificacion del bit de polaridad
            if i >= 1
                b1 = "1";
            else
                b1 = "0";
            end
            
            
            s = ceil(abs(i)/8);
           
            % Codificacion de los bit de segmento
            b2 = dec2bin(s-1,2);
            
            
            numDec = abs(i) - s.*8 + 7;
            
            
            % Codificacion de los bits de nivel dentro del segmento
            b3 = dec2bin(numDec,3);
            
            
            % Creacion de los niveles de F_x y referencia de las amplitudes
            % de xn
            k = find(abs(F_x-n) < 0.01);
            [~,idx]=min(abs(k-n));
            minIndex=k(idx);
            Fx_c(j) = F_x(minIndex);
            xn_c(j) = xn(minIndex);
            dicc(j) = strcat(b1,b2,b3);
        end
    end
    
    dicc = transpose(dicc);
end