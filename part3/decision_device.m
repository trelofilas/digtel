function [pred_s,pred_bin,symbol] = decision_device(s_sgnl,M,input_size)
    Es = 1;     
    symbol = zeros(M,1);
    symb = zeros(M,2);
    clear pred_s;clear out;clear pred_bin;clear pred_s;clear num;
    if M == 4
        for m=1:M
            symb(m,1) = sqrt(Es) * cos((2 * pi * m) / M);
            symb(m,2) = sqrt(Es) * sin((2 * pi * m) / M);
        end
    elseif M == 8
        for m=1:M
            symb(m,1) = sqrt(Es) * cos((2 * pi * m) / M);
            symb(m,2) = sqrt(Es) * sin((2 * pi * m) / M);
        end
    end
    symbol(:) = symb(:,1) + 1i * symb(:,2);
    for i=1:length(s_sgnl)
        min = realmax;
        for j=1:M
            eukl = sqrt((real(s_sgnl(i)) - real(symbol(j)))^2 + (imag(s_sgnl(i)) - imag(symbol(j)))^2);
            if eukl < min
                pred_s(i) = symbol(j);
                min = eukl;
                num(i) = j-1; 
            end
        end
    end
    pred_s = reshape(pred_s,length(pred_s),1);
    numbers = reshape(num,[size(num,2),size(num,1)]);
    binary = de2bi(numbers,'left-msb');
    binary2 = logical(binary);
    c=1;
    for q=1:size(binary2,1)
        for x=1:size(binary2,2)
            out(c) = binary2(q,x);
            %sthn eksodo pernaei h duadikh akolou8ia pou ektimh8hke
            c = c+1;
        end    
    end
    if length(out) == input_size
        pred_bin = out;
    else
       pred_bin = out(1:input_size);
    end
end