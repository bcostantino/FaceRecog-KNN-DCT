% Part 2

wait=5;
dim=35;

% read image 1 and gather feature vector
path='.\att_faces\s26\2.pgm';
fv=findfeatures(path,dim);

imshow(fv);
truesize([300 500]);
pause(wait);

% read image 2 and gather feature vector
path='./att_faces/s8/10.pgm';
[img,map]=imread(path);
imshow(img,map);
pause(wait);

fv=findfeatures(path,dim);
imshow(fv);
truesize([300 500]);