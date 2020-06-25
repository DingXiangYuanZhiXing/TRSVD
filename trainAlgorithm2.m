function [B, U_p] = trainAlgorithm2(L,tol)
% Traning process for TensorFaces Method
% Input: 
%   L  - P*V*I*E*pix tensor, pix = the length of each vectorized image
%   tol - specify relative error
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
[T,G,U] = hosvd(L,tol);
Z=T.core;
U_p=T.U{1}; 
U_v=T.U{2};
U_i=T.U{3};
U_e=T.U{4};
U_pix=T.U{5};

% compute tensor B
B=zeros(size(L));
B=ttm(ttm(ttm(ttm(Z,U_v,2),U_i,3),U_e,4),U_pix,5); % Tensor times matrix along mode i

end
