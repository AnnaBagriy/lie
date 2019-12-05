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
    error(['WRONG INDEX IN H_2(l, ii, jj, s)' newline 'l = ', num2str(l)]);
end

global s;

global x_derivative_on_1;
global y_derivative_on_1;
global x_derivative_on_2;
global y_derivative_on_2;

if l == 1
    dx = x_derivative_on_1;
    dy = y_derivative_on_1;
    
    line = sqrt(dx(ii).^2 + dy(ii).^2);
else
    dx = x_derivative_on_2;
    dy = y_derivative_on_2;
    
    line = sqrt(dx(jj).^2 + dy(jj).^2);
end
    
if ii == jj
    res = - log(exp(1) * k^2 * line^2 / 4) / 2 - double(eulergamma);
else
    res = besselk(0, k .* r2(l, l, ii, jj)) + besseli(0, k .* r2(l, l, ii, jj)) * log(4 * (sin((s(ii) - s(jj)) / 2))^2 / exp(1)) / 2;
end

end