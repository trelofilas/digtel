function [ y_p ] = my_prediction( y_cap_p, p, a, n )
    %ypologizetai to y(n) me bash ton tupo ths ekfwnhshs
    %kai tou dianusmatos suntelestwn a pou upologisthke
    %sto my_a_calculation.m
    y_pr(n) = 0;    
    for i=1:p
        y_pr(n) = y_pr(n) + a(i)*y_cap_p(n-i); 
    end
    y_p = y_pr(n);
end

