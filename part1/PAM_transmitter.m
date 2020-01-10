function [s_t, Am] = PAM_transmitter(in,M_value,gray_y_n)
%PAM_transmitter arguements:
%in=h duadikh akolouthia
%M_value=h timh tou M dhladh  (2 , 8)
%gray_y_n=an 8eloume na xrhsimopoih8ei kwdikopoihsh gray h oxi( "gray" , "nogray")
    T_symbol = 40;
    T_c = 4;
    g_tPAM = sqrt(2/T_symbol);
    f_c = 1/T_c; 
    %theloume h mesh energeia na isoutai me 1
    %apo ton tupo 7.2.3 tou bibliou 
    %prokuptei oti A = 1 gia M=2
    %kai A = 1/sqrt(21) gia M=8
    if M_value == 2
        A = 1;
        length1 = size(in,2);
        for i=1:length1
            %xwrizoume ta bits se sumbola tou asterismou
            if in(i) == 0
                m = 1;
                A_m1(i) = (2 * m - (M_value +1))* A; 
                for s=1:40
                    t=s-1;
                    s_m1(s,i) = A_m1(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif in(i) == 1
                m = 2;
                A_m1(i) = (2 * m - (M_value +1))* A;
                for s=1:40
                    t=s-1;
                    s_m1(s,i) = A_m1(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            end
        end
        Am = A_m1;%stelnw to dianusma pou einai apo8hkeumena ola ta sumbola
        %wste na mporesw na elegxw ta SER
        s_t = s_m1;%pairname to s_m1 sthn eksodo an M=2
    elseif M_value == 8
         A = 1/sqrt(21);
         binary_IN_M = vec2mat(in,3);%xwrizoume se 3ades thn eisodo
         mapper_in = bi2de(binary_IN_M,'left-msb');
         if gray_y_n == "gray"
             mapper_in = bin2gray(mapper_in,'pam',8);%gray coding
         end
         length2 = size(mapper_in,1);
         for i=1:length2
            if mapper_in(i) == 0
                m = 1;
                A_m2(i) = (2 * m - (M_value +1))* A; %-1.5275
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif mapper_in(i) == 1
                m = 2;
                A_m2(i) = (2 * m - (M_value +1))* A; %-1.0911
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif mapper_in(i) == 2
                m = 3;
                A_m2(i) = (2 * m - (M_value +1))* A; %-0.6547
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif mapper_in(i) == 3
                m = 4;
                A_m2(i) = (2 * m - (M_value +1))* A; %-0.2182
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif mapper_in(i) == 4
                m = 5;
                A_m2(i) = (2 * m - (M_value +1))* A; %0.2182
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif mapper_in(i) == 5
                m = 6;
                A_m2(i) = (2 * m - (M_value +1))* A; %0.6547
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif mapper_in(i) == 6
                m = 7;
                A_m2(i) = (2 * m - (M_value +1))* A; %1.0911
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end
            elseif mapper_in(i) == 7
                m = 8;
                A_m2(i) = (2 * m - (M_value +1))* A; %1.5275
                for s=1:40
                    t=s-1;
                    s_m2(s,i) = A_m2(i) * g_tPAM * cos( 2 * pi * f_c * t );
                end 
            end
         end
         s_t = s_m2;%pairname to s_m2 sthn eksodo an M=8
         Am = A_m2;%stelnw to dianusma pou einai apo8hkeumena ola ta sumbola
        %wste na mporesw na elegxw ta SER
    end
end