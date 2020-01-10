%simulation script
clear;
load('source.mat');
x = t;%(1:5000);
clear t;
M = size(x,1);
max = 3.5; 
min = -3.5;
for p=5:10
    for N=1:3
%N = 3; %1,2,3
%p = 5; %5:10

        y_n = zeros(M,1); %sfalma y(n)
        y_cap = zeros(M,1); %kbantismeno sfalma ^y(n)
        y_i = zeros(M,1); %problepsi y'(n)
        y_i_cap = zeros(M,1); %y'(n) + ^y(n) anakataskeuasmenes times
        memory_transmitter = zeros(M,1);
        memory_receiver = zeros(M,1);

        a_i = my_a_calculation( x, p );
        %gia tis prwtes p epanalhpseis oi anakataskeuamenes times
        %pairnoun thn timh ths eisodou x
        for i = 1:p 
            memory_transmitter(i) = x(i);
            y_i_cap(i) = x(i);
            memory_receiver(i) = x(i);
        end
        %afou oi prwtes p anakataskeuasmenes times exoun labei 
        %kapoia timh mporoun na arxisoun na ginontai oi problepseis
        %kai akolou8ws na upologistoun kai ta sfalmata
        for i = (p+1):M
            y_i(i) = my_prediction(memory_transmitter, p, a_i, i);
            y_n(i) = x(i) - y_i(i);
            y_cap(i) = my_quantizer(y_n(i),N,min,max);
            y_i_cap(i) = y_cap(i) + y_i(i);
            memory_transmitter(i) = y_i_cap(i);
            memory_receiver(i) = y_i_cap(i);
        end
        %3o erwthma
        sum = 0;
        for i=1:M
            sum = y_n(i)^2 + sum;
        end
        sfalma_2(p-4,N) = sum / M;
    end
end