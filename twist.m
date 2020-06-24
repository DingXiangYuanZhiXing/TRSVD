function [Y] = twist(X)
    [m,n] = size(X);
    Y = reshape(X,[m,1,n]);
end