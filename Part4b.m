% Part 4b, using full_eval

eval_data=zeros(24,3);
counter=1;
for i=1:6
    num_feat=(i-1)*15+25;
    for j=1:4
        k=(j-1)*2+1;
        [t_labels,p_labels,accuracy]=full_eval(num_feat,k);
        
        eval_data(counter,:)=[num_feat,k,accuracy];
        counter=counter+1;
    end
end

% save data to file
save('eval_data.mat','eval_data');

% plot full eval as function of dimension and k
scatter3(eval_data(:,1),eval_data(:,2),eval_data(:,3));
xlabel('feature dimension');
ylabel('k');
zlabel('accuracy');

