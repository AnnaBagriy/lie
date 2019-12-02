function res = H_1(l, ii, jj)
% First type of H(1) function
% As parameters takes:
%   l - boundaries (1 or 2)
%   l1 = l2 = l
%   ii - index for s-vector
%   jj - index for s-vector
%   s - vector

if l ~= 1 && l ~= 2
    error(['WRONG INDEX IN H_1(l, ii, jj, s)' newline 'l = ', num2str(l)]);
end

global k; % Some positive constant

res = - besseli(0, k .* r2(l, l, ii, jj)) / 2;

end