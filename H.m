function res = H(l1, l2, ii, jj)
% First type of H function
% As parameters takes:
%   l1 - one of the boundaries (1 or 2)
%   l2 - one of the boundaries (1 or 2)
%   l1 != l2
%   t1, t2 - are from [0, 2pi]

global k; % Some positive constant

if l1 ~= 1 && l1 ~= 2 && l2 ~= 1 && l2 ~= 2
    error(['WRONG INDEX IN H(l1, l2, t1, t2)' newline 'l1 = ', num2str(l1) newline 'l2 = ', num2str(l2)]);
elseif l1 == l2
    error(['l1 CANNOT BE EQUAL TO l2 IN H(l1, l2, t1, t2)' newline 'l1 = ', num2str(l1) newline 'l2 = ', num2str(l2)]);
end

res = besselk(0, k .* r2(l1, l2, ii, jj));

end