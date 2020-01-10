%simulation script
clear;
%gray_y_n = ["nogray","gray"] gia na thn periptwsh pou 8eloume
%kwdikopoihsh gray h oxi
gray_y_n = "nogray"; 
%eisodos tuxaies logikes times 0 kai 1
binary_IN = randsrc(1,5000)>0; 
input_size = length(binary_IN);
%M_value=2 gia M=2 kai M_value = 8 gia M=8 
M_value = 2;
s = 1; %deikths sthlhs gia na apo8hkeutoun ta apotelesmata gia ta SNR
for SNR = 0:2:20
    %kaleitai h sunarthsh tou pompou kai pairnoume to s(t)  
    [s_t, Am] = PAM_transmitter(binary_IN,M_value,gray_y_n);
    %kaleitai h sunarthsh tou 8orubou kai pairnoume to 
    %r(t) = s(t) + n(t)
    r_t = AWGN(s_t, M_value, SNR);
    %kaleitai h sunarthsei tou dekth kai pairnoume thn telikh eksodo
    [binary_OUT,As] = PAM_receiver(M_value, gray_y_n, r_t, input_size);
    %stelnw kai to input_size gia na diagrapsw ston demmaper 
    %tuxon bits pou mporei na dhmiourgh8oun ston mapper
    bit_errors = 0;
    for i=1:input_size
        if binary_IN(i) ~= binary_OUT(i)
            bit_errors = bit_errors + 1;
        end    
    end
    Am = round(Am,4);
    %stroggulopoihsh twn sumbolwn tou mapper
    %giati ta sumbola tou demapper exoun 4 dekadika
    symbol_errors = 0;
    for j=1:length(Am)
        if As(j) ~= Am(j) 
            symbol_errors = symbol_errors + 1; 
        end    
    end
    PAM_BER(s) = bit_errors/input_size;
    PAM_SER(s) = symbol_errors/length(Am);
    s = s+1;    
end   