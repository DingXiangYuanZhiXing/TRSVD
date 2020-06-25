function [label, Fro_norm] = testAlgorithm2(J, B, U_p)
% Testing process for TensorFaces Method
% Input:
%   J   - l*n matrix
%   B   - P*V*I*E*pix tensor
%   U_p - P*P tensor
% Output:
%   label    - return the label of closest image
%   Fro_norm - return the frobenius norm of closest image

% vectorize
% T(1,1,1,1,:) = J(:); 
[P, V, I, E, pix]=size(B.data);
Fro_norm = +Inf; % the minimum forbenius norm 
label = 0; % the label of minimum norm image
for v=1:V
    for i=1:I
        for e=1:E
            % flattened matrix B(v,i,e)
            B_flatten=reshape(B.data(:,v,i,e,:),[P,pix]);
            c=B_flatten*J(:);
            for p = 1:P
                tmp_norm = norm(c - U_p(p,:)', 'fro');
                if tmp_norm < Fro_norm
                    Fro_norm = tmp_norm;
                    label = p;
                end
            end
        end
    end
end
end
