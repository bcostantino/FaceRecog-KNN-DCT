% Part 4b, using full_eval

% config
plot_type=2;
filename='eval_data.mat';
load_last=true;

% model config
l_start=5;
l_incriment=5;
l_num=20;
k_start=1;
k_incriment=1;
k_num=10;

if load_last && isfile(filename)
     % File exists.
     load(filename,'eval_data','lengths','ks');
else
    % File does not exist.
    eval_data=zeros(24,3);
    counter=1;
    
    % define x and y for surface plot
    lengths=zeros(l_num,1);
    ks=zeros(k_num,1);
    
    for i=1:l_num
        num_feat=(i-1)*l_incriment+l_start;
        for j=1:k_num
            k=(j-1)*k_incriment+k_start;
            [t_labels,p_labels,accuracy]=full_eval(num_feat,k);

            eval_data(counter,:)=[num_feat,k,accuracy];
            ks(j)=k;
            counter=counter+1;
        end
        lengths(i)=num_feat;
    end
    % save data to file
    save(filename,'eval_data','lengths','ks');
end

% plot full eval as function of dimension and k
% handle scatter plot
if plot_type==1
    scatter3(eval_data(:,1),eval_data(:,2),eval_data(:,3));

% handle surface plot
elseif plot_type==2
    Z=reshape(eval_data(:,3),length(ks),length(lengths));
    surf(lengths,ks,Z);
end

xlabel('feature dimension');
ylabel('k');
zlabel('accuracy');

