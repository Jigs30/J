i = imread('C:\PU\Subjects\MVR\Matlab\mv1.jpeg');
g=rgb2gray(i);
imtool(g);
J = histeq(g);
subplot(2,2,1);
imshow( g );
subplot(2,2,2);
imhist(g)
subplot(2,2,3);
imshow( J );
subplot(2,2,4);
imhist(J)

% BW = edge(g);
% imshow(BW);