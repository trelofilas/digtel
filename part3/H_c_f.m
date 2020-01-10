function [ch_sgnl,length_h] = H_c_f(sgnl,ideal,up_rate)
    length_h = 1;
    if( ideal == "yes" )
        ch_sgnl = sgnl;
    elseif( ideal == "no")
        h = [0.04 -0.05 0.07 -0.21 -0.5 0.72 0.36 0 0.21 0.03 0.07];
        upsample_h = upsample(h,up_rate);
        upsample_h = upsample_h(1:length(upsample_h)-up_rate+1);
        ch_sgnl = conv(sgnl,upsample_h,'same');
        length_h = length(upsample_h);
    end
end