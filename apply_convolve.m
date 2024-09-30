% Author: Jasmin Khan
% Performs convolution of the input array with a filterbank and adds bias values.
% Outputs a convolved array with the same spatial dimensions but different depth (D2 channels).


function outarray = apply_convolve(inarray, filterbank, biasvals)
    % inarray: NxMxD1 input array
    % filterbank: RxCxD1xD2 array of filters
    % biasvals: length D2 vector of bias values
    % outarray: NxMxD2 output array

    [N, M, D1] = size(inarray);
    [R, C, ~, D2] = size(filterbank);

    % Print input and filter sizes
    %fprintf('Input size: [%d, %d, %d]\n', N, M, D1);
    %fprintf('Filter size: [%d, %d, %d, %d]\n', R, C, D1, D2);
    
    % Initialize the output array
    outarray = zeros(N, M, D2);
    
    % Loop through each output channel (D2)
    for l = 1:D2
        % Initialize the lth output channel to the bias value
        outchannel = biasvals(l) * ones(N, M);
        
        % Print the current bias being applied
        %fprintf('Applying bias for channel %d: %f\n', l, biasvals(l));

        % Loop through each input channel (D1)
        for k = 1:D1
            % Apply the k-th filter for the l-th output channel
            filter = filterbank(:,:,k,l);

            % Print the filter being used
            %fprintf('Filter (first 3x3 block) for input channel %d to output channel %d:\n', k, l);
            %disp(filter(1:3, 1:3));  % Display the first 3x3 block of the filter
            
            % Convolve the input image with the filter and add to the output channel
            outchannel = outchannel + imfilter(inarray(:,:,k), filter, 'conv', 'same');
        end
        
        % Store the l-th output channel
        outarray(:,:,l) = outchannel;

        % Print the convolution output
        %fprintf('final Convolution output (first few values for channel %d):\n', l);
        %disp(outchannel(1:3, 1:3));  % Display the first few values of the convolution output
    end
end
