%% load data
disp('loading data...');  
%dataDir = './database/ExtendedYaleB';  
dataDir = './database/CroppedYale';  
% 192 60 168 
% 480 250 640
l = 192;
readnum = 30;
n = 168;
[data, labels] = readYaleDataset(dataDir,l,readnum,n);

%%
disp('get training and testing data index...');  
num_trainImg = round(0.75*readnum);
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
