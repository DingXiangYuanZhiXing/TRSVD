%% load data
disp('loading data...');  
dataDir = './database/CroppedYale';  
l=192;
readnum=20;
n=168;
[data, labels]=readYaleDataset(dataDir,l,readnum,n);
%%
disp('get training and testing data...');  
num_trainImg=round(0.75*readnum);
num_class = size(unique(labels), 2);  
trainIdx = [];  
testIdx = [];  
for i=1:num_class  
    label = find(labels == i);  
%     indice = numel(label);  %randperm()
    trainIdx = [trainIdx label(1:num_trainImg)];  %indice()
    testIdx = [testIdx label(num_trainImg+1:end)];  %indice()
end  
disp('success');
%% get train and test data
train_x=zeros(l*n,size(trainIdx,2));
for i=1:size(trainIdx,2)
    image=squeeze(data(:, trainIdx(i), :));
    train_x(:,i)=image(:);
end

test_x=zeros(l*n,size(testIdx,2));
for i=1:size(testIdx,2)
    image=squeeze(data(:, testIdx(i), :));
    test_x(:,i)=image(:);
end
train_y = labels(trainIdx);  
test_y = labels(testIdx);  

%%
k_vec = 30:10:60;
acc = [];
for k = k_vec
disp('training...');
[M, U_k, C] = trainAlgorithm1(train_x, k);
correct=0;
for i=1:size(testIdx,2)
    J=test_x(:,i);
    [label, Fro_norm] = testAlgorithm1(J, M, U_k, C);
    if train_y(label)==test_y(i)
        correct=correct+1;
    end
end
acc(end+1) = correct/length(test_y);
disp('accuracy: ');
disp(acc(end));
end
