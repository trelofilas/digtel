clear;
binary_IN = randsrc(1,1e5)>0;
input_size = length(binary_IN);
up_rate = 4; %upsample rate = 4
for M = 4:4:8
    if M == 4
        M_v = 1;
    elseif M == 8
        M_v = 2;
    end
    for id = 1:2
        if id == 1
            ideal = "no";
        elseif id == 2
            ideal = "yes";
        end
        s = 1;
        for SNR = 0:2:30
        %transmitter
            sk = my_PSK_input(binary_IN,M); %sumbola eisodou
            [signal,transmitter_filter] = H_t_f(sk,M,up_rate); %filtro pompou
        %channel
            [sgnl_channel,length_h] = H_c_f(signal,ideal,up_rate);
        %filtro kanaliou
            sgnl_plus_noise = AWGN(sgnl_channel,SNR); %prosthetikos thorubos
        %reveiver
            filtered_sgnl = H_r_f(sgnl_plus_noise,transmitter_filter,up_rate); %filtro dekth
            length_filt = length(transmitter_filter);
            down_sgnl = sampler(filtered_sgnl,length_h,length_filt,up_rate); %upodeigmatolhpsia
            [pred_symbols,pred_binary,s_k] = decision_device(down_sgnl,M,input_size); %ypologismos
        %twn symbolwn kai ths duadikhs akolou8ias pou pernaei sthn eksodo
        %ypologismos SER,BER
            bit_errors = 0;
            for i=1:length(binary_IN)
                if binary_IN(i) ~= pred_binary(i)
                    bit_errors = bit_errors + 1;
                end
            end
            symbol_errors = 0;
            for j=1:length(pred_symbols)
                if pred_symbols(j) ~= sk(j)
                    symbol_errors = symbol_errors + 1;
                end
            end
            PSK_BER(s,id,M_v) = bit_errors/input_size;
            PSK_SER(s,id,M_v) = symbol_errors/length(sk);
            s = s+1;
        end
    end
    figure;
    if M == 4
        hold on;
        plot(s_k,'bo ');
        title('Αστερισμός για M=4');
        ylabel('Im(s)');
        xlabel('Re(s)');
        hold off;
    elseif M == 8
        hold on;
        plot(s_k,'bo ');
        title('Αστερισμός για M=8');
        ylabel('Im(s)');
        xlabel('Re(s)');
        hold off;
    end
end
%% PLOTS
SNR = 0:2:30;
figure;
hold on;
semilogy(SNR,PSK_SER(:,1,1)); %M = 4,no ideal
semilogy(SNR,PSK_SER(:,2,1)); %M = 4,ideal
semilogy(SNR,PSK_SER(:,1,2)); %M = 8,no ideal
semilogy(SNR,PSK_SER(:,2,2)); %M = 8,ideal
title('SER-SNR');
ylabel('SER');
xlabel('SNR');
legend('M=4,no ideal','M=4,ideal','M=8,no ideal','M=8,ideal');
hold off;
figure;
hold on;
semilogy(SNR,PSK_BER(:,1,1)); %M = 4,no ideal
semilogy(SNR,PSK_BER(:,2,1)); %M = 4,ideal
semilogy(SNR,PSK_BER(:,1,2)); %M = 8,no ideal
semilogy(SNR,PSK_BER(:,2,2)); %M = 8,ideal
title('BER-SNR');
ylabel('BER');
xlabel('SNR');
legend('M=4,no ideal','M=4,ideal','M=8,no ideal','M=8,ideal');
hold off;