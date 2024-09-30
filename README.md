# MATLAB CNN Image Classifier - CIFAR-10 Dataset

This repository contains a MATLAB implementation of a Convolutional Neural Network (CNN) for classifying images from the CIFAR-10 dataset. The CNN includes layers for normalization, convolution, ReLU activation, max-pooling, and softmax classification. The project also evaluates the classifier using overall accuracy and top-k accuracy.

## Table of Contents
- [Introduction](#introduction)
- [CNN Architecture](#cnn-architecture)
- [File Structure](#file-structure)
- [How to Run](#how-to-run)
- [Results](#results)

## Introduction
This project implements a CNN for image classification, designed specifically for the CIFAR-10 dataset. The CIFAR-10 dataset contains 60,000 images across 10 different categories (e.g., airplanes, cats, dogs). The goal is to classify these images using a deep learning approach.

The CNN architecture consists of 18 layers, including convolution, ReLU, max-pooling, and softmax. Performance is measured using both overall classification accuracy and top-k accuracy, which assesses how often the correct class is among the top k predictions.

## CNN Architecture
The CNN follows the architecture outlined below:

| Layer  | Type              | Input Size       | Filterbank Size    | Output Size       |
|--------|-------------------|------------------|--------------------|-------------------|
| 1      | imnormalize        | 32 × 32 × 3      |                    | 32 × 32 × 3       |
| 2      | convolve           | 32 × 32 × 3      | 3 × 3 × 3 × 10     | 32 × 32 × 10      |
| 3      | relu               | 32 × 32 × 10     |                    | 32 × 32 × 10      |
| 4      | convolve           | 32 × 32 × 10     | 3 × 3 × 10 × 10    | 32 × 32 × 10      |
| 5      | relu               | 32 × 32 × 10     |                    | 32 × 32 × 10      |
| 6      | maxpool            | 32 × 32 × 10     |                    | 16 × 16 × 10      |
| 7      | convolve           | 16 × 16 × 10     | 3 × 3 × 10 × 10    | 16 × 16 × 10      |
| 8      | relu               | 16 × 16 × 10     |                    | 16 × 16 × 10      |
| 9      | convolve           | 16 × 16 × 10     | 3 × 3 × 10 × 10    | 16 × 16 × 10      |
| 10     | relu               | 16 × 16 × 10     |                    | 16 × 16 × 10      |
| 11     | maxpool            | 16 × 16 × 10     |                    | 8 × 8 × 10        |
| 12     | convolve           | 8 × 8 × 10       | 3 × 3 × 10 × 10    | 8 × 8 × 10        |
| 13     | relu               | 8 × 8 × 10       |                    | 8 × 8 × 10        |
| 14     | convolve           | 8 × 8 × 10       | 3 × 3 × 10 × 10    | 8 × 8 × 10        |
| 15     | relu               | 8 × 8 × 10       |                    | 8 × 8 × 10        |
| 16     | maxpool            | 8 × 8 × 10       |                    | 4 × 4 × 10        |
| 17     | fully connected    | 4 × 4 × 10       | 4 × 4 × 10 × 10    | 1 × 1 × 10        |
| 18     | softmax            | 1 × 1 × 10       |                    | 1 × 1 × 10        |

## File Structure
The repository is organized as follows:

**CIFAR10-CNN/**
- **`main.m`**: Main script that processes all CIFAR-10 images through the CNN and computes the confusion matrix and top-k accuracy.
- **`run_demo.m`**: A demo script that runs the CNN on a single image and shows intermediate results for each layer.
- **`apply_convolve.m`**: Function for performing convolution.
- **`apply_relu.m`**: Function for ReLU activation.
- **`apply_maxpool.m`**: Function for max-pooling.
- **`apply_imnormalize.m`**: Function for normalizing the input images.
- **`apply_fullconnect.m`**: Function for the fully connected layer.
- **`apply_softmax.m`**: Function for calculating softmax probabilities.
- **`CNNparameters.mat`**: Contains the CNN filter banks and bias values.
- **`cifar10testdata.mat`**: CIFAR-10 test dataset.
- **`debuggingTest.mat`**: Debugging data for testing individual layers.

## How to Run

### Prerequisites
- MATLAB (R2023 or later)
- Image Processing Toolbox (for imfilter function)

### Instructions
1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/jasmintkhan/MATLAB-CNN-Image-Classifier.git
   cd CIFAR10-CNN
2. Run the main classification script:
   ```bash
   main
3. To visualize how a single image is processed through the CNN, run:
   ```bash
   run_demo

## Results
The following performance metrics are generated:

### 1. Confusion Matrix: Displays the model's classification results for each class.
The confusion matrix below represents the results of the CNN's predictions across 10,000 test images from the CIFAR-10 dataset. Each row represents the true class of an image, and each column represents the class predicted by the CNN. The diagonal values indicate correct predictions (true class = predicted class), while the off-diagonal values represent misclassifications.

| True Class     | Airplane | Automobile | Bird  | Cat  | Deer | Dog  | Frog  | Horse | Ship  | Truck |
|----------------|----------|------------|-------|------|------|------|-------|-------|-------|-------|
| **Airplane**    | 531      | 41         | 65    | 37   | 10   | 8    | 18    | 38    | 210   | 42    |
| **Automobile**  | 40       | 519        | 9     | 26   | 10   | 7    | 19    | 29    | 111   | 230   |
| **Bird**        | 87       | 8          | 386   | 117  | 97   | 70   | 104   | 88    | 25    | 18    |
| **Cat**         | 39       | 18         | 127   | 325  | 45   | 136  | 186   | 89    | 13    | 22    |
| **Deer**        | 53       | 6          | 270   | 69   | 259  | 38   | 162   | 114   | 22    | 7     |
| **Dog**         | 19       | 7          | 151   | 222  | 49   | 281  | 111   | 125   | 20    | 15    |
| **Frog**        | 10       | 7          | 120   | 125  | 93   | 23   | 557   | 33    | 9     | 23    |
| **Horse**       | 32       | 7          | 73    | 98   | 77   | 94   | 54    | 533   | 13    | 19    |
| **Ship**        | 192      | 84         | 35    | 44   | 7    | 8    | 10    | 16    | 542   | 62    |
| **Truck**       | 69       | 191        | 23    | 41   | 4    | 9    | 30    | 68    | 127   | 438   |

**Explanation**
- **True Class (Rows)**: Each row represents the actual class of the test image (e.g., Airplane, Automobile, etc.).
- **Predicted Class (Columns)**: Each column represents the predicted class made by the CNN.
- **Diagonal Values**: Correct predictions, where the predicted class matches the true class.
- **Off-Diagonal Values**: Misclassifications, where the CNN predicted the wrong class.

For example:
- The model correctly classified 531 images of airplanes but misclassified 41 airplanes as automobiles and 65 as birds.
- For the dog class, 281 images were correctly classified as dogs, but 222 dog images were misclassified as cats, and 151 were misclassified as birds.

This confusion matrix gives an overview of how well the CNN model performs across all 10 classes and provides insight into which classes are easily confused by the model.

### 2. Overall Accuracy: The percentage of correctly classified images.
```
Overall Accuracy: 43.71%
```
**Why 43% Accuracy?**
This accuracy is expected given the basic CNN architecture used in this project. The model consists of relatively shallow layers without more advanced techniques such as:
- Data Augmentation: Techniques like rotation, flipping, or cropping are not applied to the training data, which can help the model generalize better.
- Deeper Layers: The network has only 18 layers, and more complex networks (e.g., ResNet or VGG) typically use many more layers to extract deeper features.
- Batch Normalization & Dropout: These regularization methods can help reduce overfitting and improve the model’s ability to generalize.
- Advanced Optimizers: This implementation doesn't utilize more advanced optimization methods like Adam, which can further boost training and performance.

*The 43% accuracy reflects the performance of a basic CNN, which provides a solid foundation but leaves room for improvement with more advanced techniques.*

### 3. Top-k Accuracy: A plot showing how classification accuracy increases with the number of top predictions considered.

<img width="331" alt="Screenshot 2024-09-30 at 12 39 25 PM" src="https://github.com/user-attachments/assets/34c50d3e-b38f-4420-a753-054743e7b8f8">

- The plot shows how classification accuracy increases as we consider the top k predictions, with the accuracy reaching 100% when considering the top 10 predictions.

**Interpretation and Relevance:**
In this context, Top-k Accuracy provides insight into how often the correct class is ranked among the top k predictions, rather than solely focusing on the model’s single best guess. This is particularly important in applications where the model’s top guess might be incorrect, but the correct class is still among its top-ranked predictions.
- **Top-1 Accuracy** reflects the strict classification accuracy we computed earlier, where the model’s highest-probability prediction must match the true class. In this case, the top-1 accuracy is about 43.71%, which indicates the base performance of the model.
- **Top-3 Accuracy**, around 80%, shows that in most cases, the correct class is ranked within the top three predictions, even if the model’s top guess is incorrect. This is useful in applications where multiple predictions can be presented to a user or another model for final decision-making.
- **Top-10 Accuracy** hits 100%, meaning that by considering the top 10 predictions, the correct class is always present. While this is not as relevant for classification tasks with smaller output spaces, it’s highly meaningful in large-scale classification systems where narrowing down the options can significantly aid human decision-makers or downstream processes.

In this project, **Top-k Accuracy** demonstrates that while the model may struggle to predict the correct class outright (Top-1), it does show potential for improvement if we allow it to offer multiple guesses (Top-3 or Top-5), which can be leveraged in more flexible systems.


