% Part 3

% training the KNN classifier
% define arguments
range=[1 40];
dct_c=70;

% call training function
% all 40 subjects w/ len 70 feature vectors
[trdata,trclass]=face_recog_knn_train(range,dct_c);