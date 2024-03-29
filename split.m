function [imOut] = split(imIn,input_layer_number)

len = sqrt(input_layer_number);

imOut = zeros(input_layer_number,(60-len+1)*(360-len+1));
patchCount = 1;
for i=1:(60-len+1)
    for j=1:(360-len+1)
        t = imIn(i:i+len-1,j:j+len-1);
        imOut(:,patchCount) = t(:);
        patchCount = patchCount + 1;
    end
end
imOut = imOut';
end

