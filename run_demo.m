% Author: Jasmin Khan
% Runs a demo on a single test image through all 18 CNN layers, displaying 
% the output after each layer and showing the predicted vs. true class.

% Load data
load 'cifar10testdata.mat'
load 'CNNparameters.mat'

% Select a single test image
image_index = 21;
inarray = double(imageset(:,:,:,image_index));

% Display the original image
figure;
imagesc(uint8(inarray));
title('Original Image');

% Layer 1: Normalize the input image
outarray = apply_imnormalize(inarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 1: Normalized Image (Channel 1)');
colorbar;

% Layer 2: Convolution with filterbank{2}, biasvectors{2}
outarray = apply_convolve(outarray, filterbanks{2}, biasvectors{2});
figure;
imagesc(outarray(:,:,1));
title('Layer 2: Convolution (Channel 1)');

% Layer 3: ReLU activation
outarray = apply_relu(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 3: ReLU (Channel 1)');

% Layer 4: Convolution with filterbank{4}, biasvectors{4}
outarray = apply_convolve(outarray, filterbanks{4}, biasvectors{4});
figure;
imagesc(outarray(:,:,1));
title('Layer 4: Convolution (Channel 1)');

% Layer 5: ReLU activation
outarray = apply_relu(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 5: ReLU (Channel 1)');

% Layer 6: Max pooling
outarray = apply_maxpool(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 6: Max Pooling (Channel 1)');

% Layer 7: Convolution with filterbank{7}, biasvectors{7}
outarray = apply_convolve(outarray, filterbanks{7}, biasvectors{7});
figure;
imagesc(outarray(:,:,1));
title('Layer 7: Convolution (Channel 1)');

% Layer 8: ReLU activation
outarray = apply_relu(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 8: ReLU (Channel 1)');

% Layer 9: Convolution with filterbank{9}, biasvectors{9}
outarray = apply_convolve(outarray, filterbanks{9}, biasvectors{9});
figure;
imagesc(outarray(:,:,1));
title('Layer 9: Convolution (Channel 1)');

% Layer 10: ReLU activation
outarray = apply_relu(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 10: ReLU (Channel 1)');

% Layer 11: Max pooling
outarray = apply_maxpool(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 11: Max Pooling (Channel 1)');

% Layer 12: Convolution with filterbank{12}, biasvectors{12}
outarray = apply_convolve(outarray, filterbanks{12}, biasvectors{12});
figure;
imagesc(outarray(:,:,1));
title('Layer 12: Convolution (Channel 1)');

% Layer 13: ReLU activation
outarray = apply_relu(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 13: ReLU (Channel 1)');

% Layer 14: Convolution with filterbank{14}, biasvectors{14}
outarray = apply_convolve(outarray, filterbanks{14}, biasvectors{14});
figure;
imagesc(outarray(:,:,1));
title('Layer 14: Convolution (Channel 1)');

% Layer 15: ReLU activation
outarray = apply_relu(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 15: ReLU (Channel 1)');

% Layer 16: Max pooling
outarray = apply_maxpool(outarray);
figure;
imagesc(outarray(:,:,1));
title('Layer 16: Max Pooling (Channel 1)');

% Layer 17: Fully connected layer with filterbank{17}, biasvectors{17}
outarray = apply_fullconnect(outarray, filterbanks{17}, biasvectors{17});
figure;
imagesc(outarray(:,:,1));
title('Layer 17: Fully Connected Layer (Channel 1)');

% Layer 18: Softmax to get class probabilities
probabilities = apply_softmax(outarray);

% Get the predicted class (the one with the highest probability)
[~, predicted_class] = max(probabilities);

% Display the predicted class
disp(['Predicted class: ', classlabels{predicted_class}]);

% Compare with true class
true_class = trueclass(image_index);
disp(['True class: ', classlabels{true_class}]);

% Display the comparison result
if predicted_class == true_class
    disp('Prediction is CORRECT.');
else
    disp('Prediction is INCORRECT.');
end
