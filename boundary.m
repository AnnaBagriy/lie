function [x_1, x_2] = boundary(l, s)
param = 2;
% TODO: introduce radius not parameter

% Inner
if l == 2
%     x_1 = cos(s) + 0.1 * cos(8 .* s);
%     x_2 = sin(s);
x_1 = 0.5* cos(s);
x_2 = 0.1* sin(s);
% Outer
elseif l == 1
%     x_1 = 4* cos(s) + 0.2 * cos(12 .* s);
%     x_2 = 4*sin(s);
x_1 = param .* cos(s);
x_2 = param .* sin(s);
else
    error('WRONG INDEX IN boundary(l, s)');
end

end