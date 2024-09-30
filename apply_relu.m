% Author: Jasmin Khan
% This function applies the ReLU (Rectified Linear Unit) activation to the input array, replacing negative values with zero.

function outarray = apply_relu(inarray)
    % Input is an array of size N × M × D -->innary
    % NxMxD output array with ReLU applied -->outray
    % ReLU  function
    outarray = max(0, inarray);
end