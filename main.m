% Author: Jasmin Khan
% This script processes all test images through a CNN with 18 layers, including 
% normalization, convolution, ReLU, max pooling, and softmax. It computes class 
% predictions, updates a confusion matrix, and calculates the overall accuracy.


% Load data
load 'cifar10testdata.mat'
load 'CNNparameters.mat'
load 'debuggingTest.mat'

% Array to store predicted classes
predicted_classes = zeros(1, size(imageset, 4));

% Confusion matrix (10x10), initially filled with zeros
confusion_matrix = zeros(10, 10);

% Iterate through all the test images
for i = 1:size(imageset, 4)
    % Print progress every 1000 images
    if mod(i, 1000) == 0
        fprintf('Processed %d images out of %d\n', i, size(imageset, 4));
    end

    % Grab a 32x32 image and convert to double
    inarray = double(imageset(:,:,:,i));
    
    % Layer 1: Normalize the input image
    outarray = apply_imnormalize(inarray);

    % Layer 2: Convolution with filterbank{2}, biasvectors{2}
    outarray = apply_convolve(outarray, filterbanks{2}, biasvectors{2});
    
    % Layer 3: ReLU activation
    outarray = apply_relu(outarray);

    % Layer 4: Convolution with filterbank{4}, biasvectors{4}
    outarray = apply_convolve(outarray, filterbanks{4}, biasvectors{4});

    % Layer 5: ReLU activation
    outarray = apply_relu(outarray);

    % Layer 6: Max pooling
    outarray = apply_maxpool(outarray);

    % Layer 7: Convolution with filterbank{7}, biasvectors{7}
    outarray = apply_convolve(outarray, filterbanks{7}, biasvectors{7});

    % Layer 8: ReLU activation
    outarray = apply_relu(outarray);

    % Layer 9: Convolution with filterbank{9}, biasvectors{9}
    outarray = apply_convolve(outarray, filterbanks{9}, biasvectors{9});

    % Layer 10: ReLU activation
    outarray = apply_relu(outarray);

    % Layer 11: Max pooling
    outarray = apply_maxpool(outarray);

    % Layer 12: Convolution with filterbank{12}, biasvectors{12}
    outarray = apply_convolve(outarray, filterbanks{12}, biasvectors{12});

    % Layer 13: ReLU activation
    outarray = apply_relu(outarray);

    % Layer 14: Convolution with filterbank{14}, biasvectors{14}
    outarray = apply_convolve(outarray, filterbanks{14}, biasvectors{14});

    % Layer 15: ReLU activation
    outarray = apply_relu(outarray);

    % Layer 16: Max pooling
    outarray = apply_maxpool(outarray);

    % Layer 17: Fully connected layer with filterbank{17}, biasvectors{17}
    outarray = apply_fullconnect(outarray, filterbanks{17}, biasvectors{17});

    % Layer 18: Softmax to get class probabilities
    probabilities = apply_softmax(outarray);
    
    % Get the predicted class (the one with the highest probability)
    [~, predicted_class] = max(probabilities);
    
    % Store the predicted class as an integer
    predicted_classes(i) = predicted_class;

    % Update the confusion matrix
    true_class = trueclass(i);  % Get the true class label

    % Ensure predicted_class is within valid range (1 to 10)
    if true_class >= 1 && true_class <= 10 && predicted_class >= 1 && predicted_class <= 10
        confusion_matrix(true_class, predicted_class) = confusion_matrix(true_class, predicted_class) + 1;
    else
        warning('Skipping invalid class index. true_class = %d, predicted_class = %d', true_class, predicted_class);
    end
end

% Display the confusion matrix
disp('Confusion Matrix:');
disp(confusion_matrix);

% Calculate accuracy
correct_predictions = sum(diag(confusion_matrix));  % Sum of diagonal entries
total_predictions = sum(confusion_matrix(:));  % Total number of predictions
accuracy = correct_predictions / total_predictions;

% Display total predictions and accuracy
disp(['Total predictions: ', num2str(total_predictions)]);
disp(['Overall Accuracy: ', num2str(accuracy * 100), '%']);