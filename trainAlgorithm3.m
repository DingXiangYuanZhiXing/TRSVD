function [M, U_k, C] = trainAlgorithm3(L, k)
% Traning process for T-SVD Method
% Input: 
%   L   - l*N*n tensor, N = number of images
%   k   - scalar
% Output:
%   M   - l*1*n tensor
%   U_k - l*k*n tensor 'econ' form
%   C   - k*N*n tensor

% mean image
M = mean(L,2);

% mean-deviation form of L
A = zeros(size(L));
N = size(L,2); % number of images
for i = 1:N
    A(:,i,:) = L(:,i,:) - M;
end

% left singular vectors of tensor with only k elements
[U, ~, ~] = tsvd(A, 'econ');
U_k = U(:, 1:k, :);

C = tprod(tran(U_k), A);
end
