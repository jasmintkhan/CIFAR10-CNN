% Author: Jasmin Khan
% Converts raw class scores (logits) into probabilities using softmax. 
% Ensures numerical stability and reshapes the result to match input size.

function outarray = apply_softmax(inarray)
    % inarray: 1x1xD input array (raw class scores or logits)
    % outarray: 1x1xD output array (probabilities)

    % Flatten input to a vector
    inarray = squeeze(inarray);
    
    % Compute the maximum value for numerical stability
    alpha = max(inarray);
    
    % Compute exponentials with numerical stability
    exp_values = exp(inarray - alpha);
    
    % Compute softmax probabilities
    sum_exp = sum(exp_values);
    outarray = exp_values ./ sum_exp;
    
    % Reshape back to 1x1xD
    outarray = reshape(outarray, 1, 1, []);
end
