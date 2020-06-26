function [label, Fro_norm] = testAlgorithm1(J, M, U_k, C)
% testing process for Traditional Matrix PCA Method
% Input:
%   J   - ln*1 matrix
%   M   - ln*1 matrix
%   U_k - ln*k 'econ' form
%   C   - k*N matrix
% Output:
%   label    - return the label of closest image
%   Fro_norm - return the frobenius norm of closest image

t = J - M;
t = t(:);

c = U_k' * t;
N=size(C,2);
Fro_norm = +Inf; % the minimum forbenius norm 
label = 0; % the label of minimum norm image
for j = 1:N
    tmp_norm = norm(c - C(:,j), 'fro');
    if tmp_norm < Fro_norm
        Fro_norm = tmp_norm;
        label = j; % j-th image in the whole training set
    end
end
end
