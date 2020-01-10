function [down_sgnl] = sampler(sgnl,length_h,length_filt,up_rate)
    down_sgnl = downsample(sgnl,up_rate);
end