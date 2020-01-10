function [sgnl,filter] = H_t_f(sk,M,up_rate)
    rolloff = 0.3;
    span = 6; %6Ts
    s_k = upsample(sk,up_rate); %upedeigmatolhpsia sumbolwn
    %sxediasmos filtrou
    filter = rcosdesign(rolloff,span,up_rate,'sqrt');
    %filtrarismeno shma pou tha perasei sto kanali
    sgnl = conv(s_k,filter,'same');
end