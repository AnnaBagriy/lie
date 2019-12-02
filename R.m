function res = R(jj, k, m)
% Calculates weight function
% for Nystrom method

global s;

ii = 1:m - 1;
r = cos(ii .* (s(k) - s(jj))) ./ ii;

res = - (1 + 2 * sum(r) + cos(m * (s(k) - s(jj))) / m) / (2 * m);

end

