I1=imread('peppers.png');
figure, imshow(I1)
I2=rgb2gray(I1);  
figure, imshow(I2)

%% Image Enhancement
I = imread('pout.tif');
figure, imshow(I);

g1 = imadjust(I, [0 1], [1 0]);  % To get the negative of the image. This process, which
                                 % is the digital equivalent of obtaining a photographic negative, 
                                 % is particularly useful for enhancing white or gray detail embedded in a
                                 % large, predominantly dark region. Can also use imcomplement() function.
figure, imshow(g1);

g2 = imadjust(I, [0.5 0.75], [0 1]);  % Expands the gray scale interval between 0.5 and 0.75 to the
                                      % full [0, 1] range. This type of processing is useful for 
                                      % highlighting an intensity band of interest. 
figure, imshow(g2);

g3 = imadjust(I, [ ], [ ], 2);  % Parameter gamma specifies the shape of the curve that maps the intensity
                                 % values in I to create g3. If gamma is less than 1, the mapping is 
                                 % weighted toward higher (brighter) output values, as in Fig. 2.2(a). 
                                 % If gamma is greater than 1, the mapping is weighted toward lower (darker)
                                 % output values. If it is omitted from the function argument, 
                                 % gamma defaults to 1 (linear mapping)
figure, imshow(g3);

g4 = imadjust(I, stretchlim(I), [ ]); % Increases the contrast automatically, without mentioning the low 
                                      % and high parameters
figure, imshow(g4);

g5 = imadjust(I, stretchlim(I), [1 0]);  % Enhances the contrast of the negative image
figure, imshow(g5);