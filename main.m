% Display area D
tn=0:0.01:2 * pi;

x1 = x_vector(1, tn);
x2 = x_vector(2, tn);
y1 = y_vector(1, tn);
y2 = y_vector(2, tn);

 patch([x1, x2],...
       [y1, y2],...
       [.7 .7 .7])
 
matrix_file = 'A_matrix.txt';
vector_file = 'y_vector.txt';

A = dlmread(matrix_file);
y = dlmread(vector_file);

m = (size(y, 1)) / 4;

global s;

% distanse
r = @(x1, y1, x2, y2) sqrt((x1 - x1).^2 + (y1 - y2).^2);

% Exact solution
U = @(x,y) 1;

x = A \ y;

fi_func_1 = zeros(2 * m, 1);
fi_func_2 = zeros(2 * m, 1);

for ii = 1:2 * m 
    fi_func_1(ii) = x(ii);
    fi_func_2(ii) = x(ii + 2 * m);
end

% Find approximate solution U
U_approx = 0;

x = 1.5;
y = 0;

r_1 = sqrt((x_vector_inner(1, s) - x).^2 + (y_vector_inner(1, s) - y).^2);
r_2 = sqrt((x_vector_inner(2, s) - x).^2 + (y_vector_inner(2, s) - y).^2);

H1 = besselk(0, k .* r_1);
H2 = besselk(0, k .* r_2);

for ii = 1:2 * m 
      U_approx = U_approx + fi_func_1(ii) *...
          H1(ii) + fi_func_2(ii) * H2(ii);
end

U_approx = U_approx / (2 * m);
U_exact = U(x, y);

error = abs(U_approx - U_exact);

disp([newline char(9) 'RESULTS'])
disp(['m = ' num2str(m)])
disp(['U_exact('  num2str(x) ', ' num2str(y) ') = ' num2str(U_exact)])
disp(['U_approx(' num2str(x) ', ' num2str(y) ') = ' num2str(U_approx)])
disp(['error = ' num2str(error)])