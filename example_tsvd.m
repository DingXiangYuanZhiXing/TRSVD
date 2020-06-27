%% load data
disp('loading data...');  
dataDir = './database/CroppedYale';  
l=192;
readnum=60;
n=168;
[data, labels]=readYaleDataset(dataDir,l,readnum,n);

%%
disp('get training and testing data index...');  
num_trainImg=round(0.9*readnum);
num_class = size(unique(labels), 2);  
trainIdx = [];  
testIdx = [];  
for i=1:num_class  
    label = find(labels == i);  
    indice = randperm(numel(label));  
    trainIdx = [trainIdx label(indice(1:num_trainImg))];  
    testIdx = [testIdx label(indice(num_trainImg+1:end))];  
end  

%% get train and test data
train_x = double(data(:, trainIdx,:));  
train_y = labels(trainIdx);  
test_x = double(data(:, testIdx,:));  
test_y = labels(testIdx);  

%%
k_vec = 10:10:150;
acc = [];
for k = k_vec
disp('training...');
[M, U_k, C] = trainAlgorithm3(train_x, k);
%%
correct=0;
for i=1:length(test_y)
    J=test_x(:,i,:);
    [label, Fro_norm] = testAlgorithm3(J, M, U_k, C);
    if train_y(label)==test_y(i)
        correct=correct+1;
    end
end
acc(end+1) = correct/length(test_y);
disp('accuracy: ');
disp(acc(end));
end