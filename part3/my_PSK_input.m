function [sk] = my_PSK_input(binary_IN,M)
    input_size = length(binary_IN);
    Es = 1;
    if M == 4
        binary_IN_M = vec2mat(binary_IN,2); %xwrizoume eisodo
        in = bi2de(binary_IN_M,'left-msb'); %metatroph arithmous
        size4 = size(in,1);
        s = zeros(size4,2);
        for i=1:size4
            if in(i) == 0
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) /M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) /M);
            elseif in(i) == 1
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) /M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) /M);
            elseif in(i) == 2
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) /M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) /M);
            elseif in(i) == 3
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) /M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            end 
        end
        sk(:,1) = s(:,1) + 1i * s(:,2); %migadika sumbola gia M=4
    elseif M == 8
        binary_IN_M = vec2mat(binary_IN,3); %xwrizoume se 3ades thn eisodo
        in = bi2de(binary_IN_M,'left-msb'); %metatroph se dekadikous arithmous
        size8 = size(in,1);
        s = zeros(size8,1);
        for i=1:size8
            if in(i) == 0
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            elseif in(i) == 1
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            elseif in(i) == 2
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            elseif in(i) == 3
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            elseif in(i) == 4
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            elseif in(i) == 5
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            elseif in(i) == 6
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            elseif in(i) == 7
                m = in(i)+1;
                s(i,1) = sqrt(Es) * cos((2 * pi * m) / M);
                s(i,2) = sqrt(Es) * sin((2 * pi * m) / M);
            end
        end
        sk(:,1) = s(:,1) + 1i * s(:,2); %migadika sumbola gia M=8
    end
end