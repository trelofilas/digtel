function [y_cap] = my_quantizer( y, N, min_value, max_value )
%N tha parei times 1,2,3 otan ton xrhsimopoiei to sfalma
%kai 8 otan ton xrhsimopoiei to a
    levels = 2^N;
    %upologizontai ta diasthmata
    D = (abs(max_value) + abs(min_value)) / levels;
    %briskoume tis 2 akraies times tou kbantisth
    min_m = min_value + D/2;
    max_m = max_value - D/2;
    %ypologizontai ola ta kentra twn diasthmatwn
    i = 1;
    j = max_m;
    centers = zeros(1,levels);
    y_cap = zeros(size(y,1),1);
    while j >= min_m
        centers(i) = j;
        j = j-D;
        i = i+1;
    end
    %elegxoume se poio diasthma anhkei h ka8e timh tou y
    for i=1:size(y,1)
        if y(i) < min_value
            y_cap(i,1) = min_m;
        elseif y(i) > max_value
            y_cap(i,1) = max_m;
        else
            for k=1:levels
                if (y(i) <= (centers(k)+D/2)) && (y(i) >= (centers(k)-D/2))
                    y_cap(i,1) = centers(k);
                    break;
                end
            end
        end
    end
end