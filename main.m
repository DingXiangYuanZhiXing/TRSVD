%% load train_x train_y test_x test_y
% load('matlab.mat')
%% traing process
% k_init = kmax
kmax = 180

disp('Begin training...');
[M, U_k, C] = trainAlgorithm4(train_x, kmax);
disp('Finish training...');

%%
k_vec = kmax:-40:50;
k_vec = [k_vec 45:-5:5];
acc = [];
time_vec = [];

for k = k_vec
    U_k = U_k(:,1:k,:);
    C = C(1:k,:,:);
    %disp(size(U_k))
    %disp(size(C))
    
    disp("Begin testing...")
    correct = 0;
    for i = 1:length(test_y)
        J = test_x(:,i,:);
        [ind, Fro_norm] = testAlgorithm4(J, M, U_k, C);
        if train_y(ind) == test_y(i)
            correct = correct + 1;
        end
%         if train_y(ind) ~= test_y(i)
%             disp('===============')
%             disp(train_y(ind))
%             disp(test_y(i))
%         end
    end
    
    acc(end+1) = correct/length(test_y);
    
    disp('accuracy: ');
    disp(acc(end));
    disp("Finish testing...")
end

plot(k_vec, acc)
title("T-PQR")
xlabel("k")
ylabel("accuracy")
