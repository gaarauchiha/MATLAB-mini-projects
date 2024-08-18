% Programmer:  Abdulmajeed Alqahtani
% Section:     001
% Project:  01 
% Date:        01 June 2024 
% Description: In this project, we make and plot the maclaurin series of
% functions with certian number of terms and compare them with exact actual
% function.
% Then, we define 3 matrices and apply some algebric operations on this
% matrices, creating new matrices and getting their size and number of
% elements.

% Integrity Statement: I have completed this work with integrity. -- Abdulmajeed Alqahtani


% Problem 1

% Domian of each of the 4 functions
x_sin = -1:0.1:1;
x_exp = -1:0.1:1;
x_ln = -0.9:0.1:1; % Ommiting x = -1 for ln(1+x)
x_arctan = -1:0.1:1;

% Exact functions
y_sin_exact = sin(x_sin);
y_exp_exact = exp(x_exp);
y_ln_exact = log(1 + x_ln);
y_arctan_exact = atan(x_arctan);

% McLaurin Series
y_sin_1 = x_sin; % Only first term of MacLaurin Serires of y = sin(x)
y_sin_2 = x_sin - (x_sin.^3)/6; % Only first two terms of MacLaurin Serires of y = sin(x)
y_sin_3 = x_sin - (x_sin.^3)/6 + (x_sin.^5)/120; % Only first 3 terms of MacLaurin Serires of y = sin(x)
y_sin_4 = x_sin - (x_sin.^3)/6 + (x_sin.^5)/120 - (x_sin.^7)/5040; % First 4 terms of MacLaurin Serires of y = sin(x)

y_exp_1 = ones(size(x_exp)); % Only first term of MacLaurin Serires of y = e^x which is 1 for all x
y_exp_2 = ones(size(x_exp)) + x_exp;
y_exp_3 = ones(size(x_exp)) + x_exp + (x_exp.^2)/2;
y_exp_4 = ones(size(x_exp)) + x_exp + (x_exp.^2)/2 + (x_exp.^3)/6;

y_ln_1 = x_ln;
y_ln_2 = x_ln - (x_ln.^2)/2;
y_ln_3 = x_ln - (x_ln.^2)/2 + (x_ln.^3)/3;
y_ln_4 = x_ln - (x_ln.^2)/2 + (x_ln.^3)/3 - (x_ln.^4)/4;

y_arctan_1 = x_arctan;
y_arctan_2 = x_arctan - (x_arctan.^3)/3;
y_arctan_3 = x_arctan - (x_arctan.^3)/3 + (x_arctan.^5)/5;
y_arctan_4 = x_arctan - (x_arctan.^3)/3 + (x_arctan.^5)/5 - (x_arctan.^7)/7;

figure;

subplot(2, 2, 1);
plot(x_sin, y_sin_1, 'r', x_sin, y_sin_2, 'g', x_sin, y_sin_3, 'b', x_sin, y_sin_4, 'm', x_sin, y_sin_exact, 'k');
title('Plot of sin(x)');
xlabel('x');
ylabel('y = sin(x)');
legend('1 term', '2 terms', '3 terms', '4 terms', 'Exact');

subplot(2, 2, 2);
plot(x_exp, y_exp_1, 'r', x_exp, y_exp_2, 'g', x_exp, y_exp_3, 'b', x_exp, y_exp_4, 'm', x_exp, y_exp_exact, 'k');
title('Plot of e^x');
xlabel('x');
ylabel('y = e^x');
legend('1 term', '2 terms', '3 terms', '4 terms', 'Exact');

subplot(2, 2, 3);
plot(x_ln, y_ln_1, 'r', x_ln, y_ln_2, 'g', x_ln, y_ln_3, 'b', x_ln, y_ln_4, 'm', x_ln, y_ln_exact, 'k');
title('Plot of ln(1+x)');
xlabel('x');
ylabel('y = ln(1+x)');
legend('1 term', '2 terms', '3 terms', '4 terms', 'Exact');

subplot(2, 2, 4);
plot(x_arctan, y_arctan_1, 'r', x_arctan, y_arctan_2, 'g', x_arctan, y_arctan_3, 'b', x_arctan, y_arctan_4, 'm', x_arctan, y_arctan_exact, 'k');
title('Plot of arctan(x)');
xlabel('x');
ylabel('y = arctan(x)');
legend('1s term', '2 terms', '3 terms', '4 terms', 'Exact');


%% 

% Problem 2

A = [1, 5, 2; 8, 7, 1; 6, 3, 6]
b = [4, 7, 8]
c = [5; 1; 9]

% 1. d = Second row of matrix A
d = A(2, :)

% 2. e = Copy of the bottom left-hand corner of matrix A
e = A(2:3, 1:2)

% 3. f = Multiplying the transpose of row 2 of A(which is matrx d) with c
f = d'.* c

% 4. g = Copy of A but we replace top right-hand corner with 2*2 zeros
g = A;
h = zeros(2, 2); % 2*2 Zeros matrix
g(1:2, 2:3) = h

% 5. i = minimum value of A calculated by converting A to vector
i = min(A(:))

% 5. j = minimum value of A calculated without changing dimensions with
% nested functions of min(min())
j = min(min(A))

% 6. k = Number of elements in matrix b
k = numel(b)

% 7. Size of matrix c
[num_rows, num_cols] = size(c)




