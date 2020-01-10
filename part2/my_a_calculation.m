function [ a ] = my_a_calculation( x, p )
    N = size(x,1);
    r = zeros(p,1);
    R = zeros(p,p);
    pred_N = 8;
    max_value = 2;
    min_value = -2;
    %ypologizetai to dianusma autosusxetishs
    for i = 1:p
        sum1 = 0;
        for n = p+1:N
            sum1 = sum1 + (x(n) * x(n-i));
        end
        r(i,1) = (1 / (N-p)) * sum1;
    end
    %ypologizetai o pinakas autosusxetishs
    for i = 1:p
        for j = 1:p
            sum2 = 0;
            for n = p+1:N
                sum2 = sum2 + (x(n-j) * x(n-i));
            end
            R(i,j) = (1 / (N-p)) * sum2;
        end
    end  
    R_1 = R ^ (-1);
    %ypologizontai oi suntelestes a tou filtrou problepshs
    a = R_1 * r;
    %epistrefontai sthn eksdodo ths sunarthshs oi suntelestes
    %tou filtrou problepshs a afou kbantistous oi times tous
    %gia N=8 kai sto diasthma [-2,2]
    a = my_quantizer(a1, pred_N, min_value, max_value);  
end