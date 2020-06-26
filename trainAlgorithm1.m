function [M, U_k, C] = trainAlgorithm1(L, k)
% traning process for Traditional Matrix PCA Method
% Input: 
%   L   - (ln)*N matrix, N = number of images
%   k   - scalar
% Output:
%   M   - (ln)*1 matrix
%   U_k - (ln)*k matrix 'econ' form
%   C   - k*N matrix

% mean image
M = mean(L,2);

% mean-deviation form of L
A = L - repmat(M,[1,size(L,2)]);

% left singular vectors of tensor with only k elements
[U,~,~] = svd(A, 'econ');
U_k = U(:,1:k);

C = U_k'*A;
end
