global m;
global k;
global s;

global y1_out;
global y2_out;

global x_derivative_on_1;
global y_derivative_on_1;
global x_derivative_on_2;
global y_derivative_on_2;

syms t;

x_derivative_on_1 = matlabFunction(diff(x_vector(1,t),t));
y_derivative_on_1 = matlabFunction(diff(y_vector(1,t),t));
x_derivative_on_2 = matlabFunction(diff(x_vector(2,t),t));
y_derivative_on_2 = matlabFunction(diff(y_vector(2,t),t));

k = 1;
m = 2;

y1_out = 4;
y2_out = 0;

% Init matrix and right vector
matrix_initialization

% Display area D
tn=0:0.01:2 * pi;

X1 = x_vector(1, tn);
X2 = x_vector(2, tn);
Y1 = y_vector(1, tn);
Y2 = y_vector(2, tn);

patch([X1, X2],...
      [Y1, Y2],...
      [.7 .7 .7])
 
matrix_file = 'A_matrix.txt';
vector_file = 'y_vector.txt';

A = dlmread(matrix_file);
y = dlmread(vector_file);

x = A \ y;

fi_func_1 = zeros(2 * m, 1);
fi_func_2 = zeros(2 * m, 1);

for ii = 1:2 * m 
    fi_func_1(ii) = x(ii);
    fi_func_2(ii) = x(ii + 2 * m);
end

% Find solution in this point
x1 = 0;
x2 = 0.5;

H1 = besselk(0, k .* sqrt((x_vector(1, s) - x1).^2 + (y_vector(1, s) - x2).^2));
H2 = besselk(0, k .* sqrt((x_vector(2, s) - x1).^2 + (y_vector(2, s) - x2).^2));

% Find approximate solution U
U_approx = 0;
for ii = 1:2 * m 
      U_approx = U_approx + fi_func_1(ii) * H1(ii) + fi_func_2(ii) * H2(ii);
end

% Exact solution
U = @(x1, x2) besselk(0, k .* sqrt((x1 - y1_out).^2 + (x2 - y2_out).^2)) / (2*pi);

U_approx = U_approx / (2 * m);
U_exact = U(x1, x2);

error = abs(U_approx - U_exact);

disp([newline char(9) 'RESULTS'])
disp(['k = ' num2str(k)])
disp(['m = ' num2str(m)])
disp(['U_exact('  num2str(x1) ', ' num2str(x2) ') = ' num2str(U_exact)])
disp(['U_approx(' num2str(x1) ', ' num2str(x2) ') = ' num2str(U_approx)])
disp(['error = ' num2str(error)])