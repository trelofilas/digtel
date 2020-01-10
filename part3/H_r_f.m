function [rcv_sgnl] = H_r_f(sgnl,transm_filter,up_rate)
    rcv_filter = transm_filter;
    rcv_sgnl = conv(sgnl,rcv_filter,'same');
end