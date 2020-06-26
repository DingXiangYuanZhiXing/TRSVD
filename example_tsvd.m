%% load data
disp('loading data...');  
dataDir = 'E:\matlab³ÌÐò\CroppedYale';  
l=32;
readnum=20;
n=32;
[data, labels]=readYaleDataset(dataDir,l,readnum,n);

%%
disp('get training and testing data index...');  
num_trainImg=15;
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
k=20;
disp('training...');
[M, U_k, C] = trainAlgorithm3(train_x, k);
%%
correct=0;
for i=1:total_test
    J=test_x(:,i,:);
    [label, Fro_norm] = testAlgorithm3(J, M, U_k, C);
    if train_y(label)==test_y(i)
        correct=correct+1;
    end
end
disp('accuracy: ');
disp(correct/total_test);