% Part 1

wait=3;

% read and plot the image
[img,map]=imread('.\att_faces\s26\2.pgm');
imshow(img,map);
pause(wait);

% find and plot the 2D DCT of the image
imgdct=dct2(img);
imshow(imgdct,map);
pause(wait);

% find and plot the inverse 2D DCT to recover the original image
img2=idct2(imgdct);
imshow(img2,map);
pause(wait);

% compute and plot log magnitude of 2-D DCT
t1=0.01.*abs(imgdct); 
t2=0.01*max(max(abs(imgdct)));
c_hat=255*(log10(1+t1)/log10(1+t2)); 
imshow(c_hat,map); 
title('Log Magnitude of 2-D DCT');
