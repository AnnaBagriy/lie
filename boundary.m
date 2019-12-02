function [x_1, x_2] = boundary(l, s)

% Inner
if l == 2
    x_1 = 0.5 .* cos(s);
    x_2 = 0.4 .* sin(s) - 0.3 .* (sin(s)).^2;
% Outer
elseif l == 1
    x_1 = 1.3 .* cos(s);
    x_2 = sin(s);
else
    error('WRONG INDEX IN boundary(l, s)');
end

end