function [M, U_k, C] = trainAlgorithm2(L, k)
% Traning process for T-SVD Method
% Input: 
%   L  - l*N*n tensor, l = number of images
%   k  - scalar
% Output:
%   M  - l*1*n tensor
%   U_k- l*k*n tensor 'econ' form
%   C  - k*N*n tensor

% mean image
M = mean(L,2);

% mean-deviation form of L
A = zeros(size(L));
for i = 1:N
    A = L(:,i,:) - M;
end

% left singular vectors of tensor with only k elements
[U,~,~] = tsvd(A);
U_k = U(:,1:k,:);

C = tprod(tran(U_k), A);
end