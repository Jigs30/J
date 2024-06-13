I=imread('peppers.png');
gr=rgb2gray(I);
e=edge(gr);
figure;
imshow(e);
e1=edge(e,"sobel");
figure;
imshow(e1);