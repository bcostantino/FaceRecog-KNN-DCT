% Part 4b, using full_eval

% configuration
plot_type=1;

if isfile(filename)
     % File exists.
     load('eval_data.mat','eval_data');
else
    % File does not exist.
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
end

% plot full eval as function of dimension and k
% handle scatter plot
if plot_type==1
    scatter3(eval_data(:,1),eval_data(:,2),eval_data(:,3));

% handle surface plot
elseif plot_type==2
    Z=reshape(eval_data(:,3),4,6);
    surf([25 40 55 70 85 100],[1 3 5 7],Z);
end

xlabel('feature dimension');
ylabel('k');
zlabel('accuracy');

