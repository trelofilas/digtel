function [binary_OUT,As] = PAM_receiver(M_value, gray_y_n, r_t, input_size)
%PAM_receiver arguements:
%M_value=h timh tou M dhladh  (2 , 8)
%gray_y_n=an 8eloume na xrhsimopoih8ei kwdikopoihsh gray h oxi( "gray" , "nogray")
%r_t=to shma pou periexei kai ton 8orubo
%input_size=to mhkos ths duadikhs akolou8ias eisodou
    T_symbol = 40 ;
    g_tPAM = sqrt(2/T_symbol);
    T_c = 4;
    f_c = 1/T_c; 
    %ftiaxnoume ena dianusma bashs to opoio 8a pollaplasiamoume me to shma mas
    for s = 1:40
        t = s-1;
        z(1,s) = g_tPAM * cos( 2 * pi * f_c * t );
    end
    %pollaplasiazoume to shma me to ginomeno gt*cos(2πfct)
    d_t = z * r_t;
    %dhmiourgh8hke ena dianusma 1x(ari8mo symbolwn mas)
    l=1;
    n=1;
    %ftiaxnw enan pinaka A_s pou periexei ta sumbola tou asterismou
    %elegxw thn eukleidia apostash twn sumbolwn pou periexei to d_t me 
    %ton pinaka A_s kai apo8hkeuontai ston Am to sumbolo tou A_s 
    %pou epilex8hke gia ka8e sumbolo tou d_t 
    for j=1:length(d_t)
        if M_value == 2
            min = realmax;
            A_s = [-1 1];
            for i=1:M_value
                eukl_dis = sqrt((A_s(i) - d_t(j))^2); 
                if eukl_dis < min
                    min = eukl_dis;
                    Am(j) = A_s(i);              
                end
            end
            As = Am;
            if Am(j) == -1
                num2(n) = 0;
                n = n+1;
            elseif Am(j) == 1
                num2(n) = 1;
                n = n+1;
            end    
            bin_OUT = logical(num2); 
           %sthn eksodo pernaei h duadikh akolou8ia pou ektimh8hke 
        elseif M_value == 8
            A_s = [-1.5275,-1.0911,-0.6547,-0.2182,0.2182,0.6547,1.0911,1.5275];  
            min = realmax;
            for i=1:M_value
                eukl_dis = sqrt((A_s(i) - d_t(j))^2); 
                if eukl_dis < min
                    min = eukl_dis;
                    Am(j) = A_s(i); 
                                
                end
            end
            As = Am;
            if Am(j) == -1.5275
                num8(l) = 0;
                l=l+1;
            elseif Am(j) == -1.0911
                num8(l) = 1;
                l = l+1;
            elseif Am(j) == -0.6547
                num8(l) = 2;
                l = l+1;
            elseif Am(j) == -0.2182
                num8(l) = 3;
                l = l+1;
            elseif Am(j) == 0.2182
                num8(l) = 4;
                l = l+1;
            elseif Am(j) == 0.6547
                num8(l) = 5;
                l = l+1;
            elseif Am(j) == 1.0911
                num8(l) = 6;
                l = l+1;
            elseif Am(j) == 1.5275
                num8(l) = 7;
                l = l+1;
            end
            num8s = reshape(num8,[size(num8,2),size(num8,1)]);
            c=1;
            if gray_y_n == "gray"
                degray = gray2bin(num8s,'pam',8);
                binag = de2bi(degray,'left-msb');
                binagl = logical(binag);
                for q=1:size(binagl,1)
                    for x=1:size(binagl,2)
                        bin_OUT(c) = binagl(q,x);
                        %sthn eksodo pernaei h duadikh akolou8ia pou ektimh8hke
                        c = c+1;
                    end    
                end    
            elseif gray_y_n == "nogray"
                binan = de2bi(num8s,'left-msb');
                binanl = logical(binan);
                for q=1:size(binanl,1)
                    for x=1:size(binanl,2)
                        bin_OUT(c) = binanl(q,x);
                        %sthn eksodo pernaei h duadikh akolou8ia pou ektimh8hke
                        c = c+1;
                    end    
                end  
            end
        end
    end
    if size(bin_OUT,2) == input_size
        binary_OUT = bin_OUT;
    else
       binary_OUT = bin_OUT(1:input_size);
    end
end