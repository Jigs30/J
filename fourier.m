k1=imread("mv1.jpeg"); 
k=rgb2gray(k1);
  
% Apply fourier transformation. 
f=fft2(k); 
  
% Take magnitude of FT. 
f1=abs(f); 
  
% Take log of magnitude of FT. 
f2=log(abs(f)); 
  
% Shift FT from corners to central part. 
f3=log(abs(fftshift(f))); 
  
% Display all three FT images. 
imtool(f1,[]);  
imtool(f2,[]); 
imtool(f3,[]); 
  
% Remove some frequency from FT. 
f(1:20, 20:40)=0; 
imtool(log(abs(f)),[]); 