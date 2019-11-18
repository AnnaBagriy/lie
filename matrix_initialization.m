format long

global n_11; % 1 compoment on l=1
global n_21; % 2 compoment on l=1
global n_12; % 1 compoment on l=2
global n_22; % 2 compoment on l=2

global x1;
global y1;
global x2;
global y2;

global m;

global k;
k = 1;

m = 8;
h = pi / m;
jj = 1:2 * m;
s = (jj - 1) * h;

r_1 = @(x,y) sqrt((x_vector(1, s) - x).^2 + (y_vector(1, s) - y).^2);
r_2 = @(x,y) sqrt((x_vector(2, s) - x).^2 + (y_vector(2, s) - y).^2);

x1 = x_vector(1, s);
y1 = y_vector(1, s);
x2 = x_vector(2, s);
y2 = y_vector(2, s);

n_11 = n1(1, s);
n_21 = n2(1, s);
n_12 = n1(2, s);
n_22 = n2(2, s);

f1 = @(x, y) 1;
f2 = @(x, y) 1;

f1_k = f1(x1, y1);
f2_k = f2(x2, y2);

% Right part of the system
y = zeros (4 * m, 1);

for ii = 1:2 * m
    y(ii) = 1; 
    y(2 * m + ii) = 1;
end

% Main matrix
A = zeros(4 * m, 4 * m);

for ii = 1:2 * m   
    for jj = 1:2 * m
        %disp(['R = ', num2str(R(ii, m))])
        
        A(ii, jj) = R(ii, m) * H_1(1, ii, jj) + H_2(1, ii, jj) / (2 * m);
        A(ii, jj + 2 * m) = H(1, 2, ii, jj) / (2 * m);
        A(ii + 2 * m, jj) = H(2, 1, ii, jj) / (2 * m);
        A(ii + 2 * m, jj + 2 * m) = R(ii, m) * H_1(2, ii, jj) + H_2(2, ii, jj) / (2 * m);
    end
end

matrix_file = 'A_matrix.txt';
vector_file = 'y_vector.txt';

mid = fopen(matrix_file, 'wt');
vid = fopen(vector_file, 'wt');

for ii = 1:size(A, 1)
    fprintf(mid, '%g\t', A(ii, :));
    fprintf(mid, '\n');
end

fprintf(vid, '%d\n', y);

fclose(mid);
fclose(vid);

disp('the end of matrix initialization');

main