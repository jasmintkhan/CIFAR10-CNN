% Author: Jasmin Khan
% Applies a fully connected layer to the input. Multiplies the input by the 
% filter bank and adds bias, producing a 1x1xD2 output array.

function outarray = apply_fullconnect(inarray, filterbank, biasvals)
    [N, M, D1] = size(inarray);
    D2 = size(filterbank, 3);
    outarray = zeros(1, 1, D2);
    
    for l = 1:D2
        % disp(filterbank(:,:,:,l) .* inarray);
        outarray(:,:,l) = sum(sum(sum(filterbank(:,:,:,l) .* inarray))) + biasvals(:,l);
    end
end
