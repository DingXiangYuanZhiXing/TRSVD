%% load train_x train_y test_x test_y
load('matlab.mat')
%% traing process
% k_init = kmax
kmax = 40
disp('Begin training...');
[M, U_k, C] = trainAlgorithm3(train_x, kmax);
disp('Finish training...');

%%
k_vec = kmax:-2:2;
acc = [];

for k = k_vec
    U_k = U_k(:,1:k,:);
    C = C(1:k,:,:);
    disp(size(U_k))
    disp(size(C))
    
    disp("Begin testing...")
    correct=0;
    for i = 1:length(test_y)
        J = test_x(:,i,:);
        [ind, Fro_norm] = testAlgorithm3(J, M, U_k, C);
        if train_y(ind) == test_y(i)
            correct = correct + 1;
        end
        if train_y(ind) ~= test_y(i)
            disp('===============')
            disp(train_y(ind))
            disp(test_y(i))
        end
    end
    
    acc(end+1) = correct/length(test_y);
    
    disp('accuracy: ');
    disp(acc(end));
    disp("Finish testing...")
end