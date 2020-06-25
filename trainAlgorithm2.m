function [B, U_p] = trainAlgorithm2(L)
% Traning process for TensorFaces Method
% Input: 
%   L  - P*V*I*E*pix tensor, pix = the length of each vectorized image
% Output:
%   U_p- P*P tensor
%   B  - P*V*I*E*pix tensor
% Note:
%   Z  - P*V*I*E*(PVIE) core tensor
%   U_v- V*V tensor
%   U_i- I*I tensor
%   U_e- E*E tensor
%   U_pix- pix*(PVIE) tensor


% hosvd to get core tensor and orthogonal matrices

% compute tensor B
B=zeros(size(L));
B=tmul(tmul(tmul(tmul(Z,U_v,2),U_i,3),U_e,4),U_pix,5);

end
