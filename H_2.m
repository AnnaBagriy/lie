function res = H_2(l, ii, jj)
% First type of H(2) function
% As parameters takes:
%   l - boundaries (1 or 2)
%   l1 = l2 = l
%   ii - index for s-vector
%   jj - index for s-vector
%   s - vector

global k; % Some positive constant

if l ~= 1 && l ~= 2
    error(['WRONG INDEX IN H1_2(l, ii, jj, s)' newline 'l = ', num2str(l)]);
end

if ii == jj
    res = 0;
else
    res = - log(exp(1) * k^2 / 4) / 2 - eulergamma;
end

end