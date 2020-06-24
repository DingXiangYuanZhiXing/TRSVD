function [M, A, U_k] = trainAlgorithm4(L, k)
% traning process for T-SVD Method
% Input: 
%   L  - l*N*n tensor, l = number of images
%   k  - scalar
% Output:
%   M  - l*1*n tensor
%   A  - l*N*n tensor
%   U_k- l*k*n tensor 'econ' form

% mean image
M = mean(L,2);

% mean-deviation form of L
A = zeros(size(L));
for i = 1:N
    A = L(:,i,:) - M;
end

% left singular vectors of tensor with only k elements

end