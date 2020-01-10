function [sgnl_plus_noise] = AWGN(ch_sgnl,SNR)
    s1 = 0;
    s2 = 0;
    for i=1:length(ch_sgnl)
        s1 = real(ch_sgnl(i))^2 + s1;
        s2 = imag(ch_sgnl(i))^2 + s2;
    end
    s = s1 + s2;
    Ps = s/length(ch_sgnl);
    Pn = Ps / (10^(SNR/10));
    rand_noise = (randn(length(ch_sgnl),1) + 1i*randn(length(ch_sgnl),1))/sqrt(2);
    sigma = sqrt(Pn);
    noise = sigma * rand_noise;
    sgnl_plus_noise = ch_sgnl + noise;
end