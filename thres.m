% Read the image
img = imread('peppers.png'); % Replace 'your_image.jpg' with the path to your image

% Convert the image to grayscale if it's not already in grayscale
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Display the original image
figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

% Perform thresholding
threshold = 100; % You can adjust this threshold value
binary_img = img > threshold;

% Display the segmented image
subplot(1, 2, 2);
imshow(binary_img);
title('Segmented Image');

% Optional: Display the histogram of the image
figure;
imhist(img);
title('Histogram of Original Image');
