function [M, U_k, C] = trainAlgorithm1(L, k)
% traning process for Traditional Matrix PCA Method
% Input: 
%   L   - l*N*n tensor, N = number of images
%   k   - scalar
% Output:
%   M   - (ln)*1 matrix
%   U_k - (ln)*k matrix 'econ' form
%   C   - k*N matrix
[l,N,n] = size(L);
L_new = zeros(l*n,N);

for i = 1:N
    L_new(:,i) = vec(L(:,i,:));
end

% mean image
M = mean(L_new,2);

% mean-deviation form of L
A = L_new - repmat(M,[1,size(L_new,2)]);

% left singular vectors of tensor with only k elements
[U,~,~] = svd(A, 'econ');
U_k = U(:,1:k);

C = U_k'*A;
end
