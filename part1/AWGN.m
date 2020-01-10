function r_t = AWGN(s_t , M_value , SNR )
%AWGN arguements:
%s_t=to shma pou bghke apo ton apostolea
%M_value=h timh tou M dhladh (2 , 8)
%SNR
E_b = 1/log2(M_value);
sigma_2 = E_b / (2 * 10^(SNR / 10)); %var^2
noise = sqrt(sigma_2) * randn(size(s_t,1)*size(s_t,2),1);
[sz1,sz2] = size(s_t);
n_t = reshape(noise,[sz1,sz2]);
r_t = s_t + n_t;
end