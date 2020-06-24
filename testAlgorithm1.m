function [label, Fro_norm] = testAlgorithm1(J, M, U_k, C)
% testing process for Traditional Matrix PCA Method
% Input:
%   J   - ln*1 matrix
%   M   - ln*1 matrix
%   A   - ln*N matrix
%   U_k - ln*k 'econ' form
%   c   - k*1 matrix
% Output:
%   label    - return the label of closest image
%   Fro_norm - return the frobenius norm of closest image

t = J - M;
t = t(:);

c = U_k' * t;

Fro_norm = +Inf; % the minimum forbenius norm 
label = 0; % the label of minimum norm image
for j = 1:N
    tmp_norm = norm(c - C(:,j), 'fro');
    if tmp_norm < Fro_norm
        Fro_norm = tmp_norm;
        label = j;
    end
end
end
