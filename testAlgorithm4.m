function [label, Fro_norm] = testAlgorithm4(J, M, Q_k, C)
% Testing process for T-SVD Method
% Input:
%   J   - l*1*n matrix
%   M   - l*1*n tensor
%   A   - l*N*n tensor
%   U_k - l*k*n 'econ' form
%   C   - k*N*n tensor
% Output:
%   label    - return the label of closest image
%   Fro_norm - return the frobenius norm of closest image
N=size(C,2);

T(:,1,:) = J - M;
B = tprod(tran(Q_k),T); % k*1*n tensor

Fro_norm = +Inf; % the minimum forbenius norm 
label = 0; % the label of minimum norm image
for j = 1:N
    tmp_norm = norm(squeeze(B - C(:,j,:)), 'fro');
    if tmp_norm < Fro_norm
        Fro_norm = tmp_norm;
        label = j;
    end
end
end
