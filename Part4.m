% Part 4

% load training data, identify features (X) and labels (Y)
load('raw_data.mat', 'dct_coef', 'trdata_raw', 'trclass', 'f_range', 'nsubjects');
X=trdata_raw;
Y=trclass;
num_features=dct_coef;

% fit knn to training data
k = 3;
Mdl = fitcknn(X,Y,'NumNeighbors',k,'Standardize',1);

% load testing data
test_feat=zeros(200,num_features);
true_labels=zeros(200,1);
for i = 1:40
    face_feat=zeros(5,num_features);
    for j = 1:5
        fname = ['.\att_faces\s'...
            num2str(i) '\' num2str(j+5) '.pgm'];
        face_feat(j,:)=findfeatures(fname,num_features);
    end
    i_start=(i-1)*5+1;
    i_end=(i-1)*5+5;
    test_feat(i_start:i_end,:)=face_feat;
    true_labels(i_start:i_end)=i;
end

% make prediction against trained model
x=test_feat;
[label]=predict(Mdl,x);

% evaluate predicted labels against true labels
num_correct=0;
for i = 1:200
    if label(i)==true_labels(i)
        num_correct=num_correct+1;
    end
end
accuracy=num_correct/200;
