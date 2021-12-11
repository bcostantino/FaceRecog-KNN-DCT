% Full evaluation for Part 4 of the project

function [t_labels,p_labels,accuracy]=full_eval(feat_len,k)
    % training the KNN classifier
    range=[1 40];
    [X,Y]=face_recog_knn_train(range,feat_len);
    Mdl = fitcknn(X,Y,'NumNeighbors',k,'Standardize',1);
    
    % load testing data and find features
    test_feat=zeros(200,feat_len);
    t_labels=zeros(200,1);
    for i = 1:40
        face_feat=zeros(5,feat_len);
        for j = 1:5
            fname = ['.\att_faces\s'...
                num2str(i) '\' num2str(j+5) '.pgm'];
            face_feat(j,:)=findfeatures(fname,feat_len);
        end
        i_start=(i-1)*5+1;
        i_end=(i-1)*5+5;
        test_feat(i_start:i_end,:)=face_feat;
        t_labels(i_start:i_end)=i;
    end
    
    % predict testing labels with KNN model
    [p_labels]=predict(Mdl,test_feat);
    
    % evaluate predicted labels against true labels
    num_correct=0;
    for i = 1:200
        if p_labels(i)==t_labels(i)
            num_correct=num_correct+1;
        end
    end
    accuracy=num_correct/200;
end