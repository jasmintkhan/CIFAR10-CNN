% Author: Jasmin Khan
% This function normalizes the input image by scaling pixel values to the range [-0.5, 0.5].

function outarray = apply_imnormalize(inarray)
    % Scaling the input value 
    outarray = double(inarray) / 255.0 - 0.5;

    % enssuring that the output will be the same size as the input 
    assert(all(size(outarray) == size(inarray)));
end
