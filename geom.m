% Read the image
img = imread('coins.bmp'); % Replace 'your_image.jpg' with the path to your image

% Convert the image to grayscale if it's not already in grayscale
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Display the original image
figure;
subplot(2, 3, 1);
imshow(img);
title('Original Image');

% Translation
tx = 50; % Translation along x-axis
ty = 30; % Translation along y-axis
translated_img = imtranslate(img, [tx, ty]);
subplot(2, 3, 2);
imshow(translated_img);
title('Translated Image');

% Rotation
angle = 30; % Rotation angle in degrees
rotated_img = imrotate(img, angle, 'bilinear', 'crop');
subplot(2, 3, 3);
imshow(rotated_img);
title('Rotated Image');

% Scaling
scale_factor_x = 1.5; % Scaling factor along x-axis
scale_factor_y = 0.8; % Scaling factor along y-axis
scaled_img = imresize(img, [round(scale_factor_y*size(img,1)), round(scale_factor_x*size(img,2))]);
subplot(2, 3, 4);
imshow(scaled_img);
title('Scaled Image');

% Shearing
shear_factor_x = 0.2; % Shearing factor along x-axis
shear_factor_y = 0.3; % Shearing factor along y-axis
tform = affine2d([1 shear_factor_x 0; shear_factor_y 1 0; 0 0 1]);
sheared_img = imwarp(img, tform);
subplot(2, 3, 5);
imshow(sheared_img);
title('Sheared Image');

% Reflection (Horizontal)
reflected_img = flip(img, 2);
subplot(2, 3, 6);
imshow(reflected_img);
title('Reflected Image (Horizontal)');
