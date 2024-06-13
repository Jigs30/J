% Read the image
img = imread('peppers.png'); % Replace 'your_image.jpg' with the path to your image

% Convert the image to grayscale if it's not already in grayscale
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Compute the Fourier Transform of the image
F = fft2(img);

% Shift the zero frequency component to the center
F_shifted = fftshift(F);

% Compute the magnitude spectrum (logarithmic scale for better visualization)
magnitude_spectrum = log(1 + abs(F_shifted));

% Find the threshold frequency
[rows, cols] = size(img);
center_row = floor(rows / 2) + 1;
center_col = floor(cols / 2) + 1;
radius = 50; % Radius of the circular region in the frequency domain
mask = false(rows, cols);
[mask_rows, mask_cols] = find(mask == 0);
dist_from_center = sqrt((mask_rows - center_row).^2 + (mask_cols - center_col).^2);
threshold_freq = (dist_from_center <= radius);

% % Apply the threshold to the Fourier Transform
% F_segmented = F_shifted .* threshold_freq;
% 
% % Shift back the zero frequency component
% F_segmented = ifftshift(F_segmented);

% Compute the inverse Fourier Transform
img_segmented = ifft2(F_shifted);

% Convert to uint8 and scale to [0, 255] range
img_segmented = uint8(real(img_segmented));
img_segmented = mat2gray(img_segmented) * 255;

% Display the original and segmented images
figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');
subplot(1, 2, 2);
imshow(img_segmented, []);
title('Segmented Image');

% Optional: Display the magnitude spectrum
figure;
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum');
