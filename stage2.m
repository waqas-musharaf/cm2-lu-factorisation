function [x] = stage2(U, b)

% stage2.m:
% A function which takes as input any size of real, square, upper
% triangular matrix 'U' together with an RHS vector 'b' and computes
% and outputs the solution vector 'x' to the triangular system of
% equations Ux = b using back substitution.

% Author: Waqas Musharaf

% Checks if input U is real (contains only real elements).
if ~isreal(U)
    error('Error: Input U is not real.')
end

% Checks if input U is a square matrix:
% size() returns the dimensions of the input,
% diff() returns the difference between the dimensions returned.
% If there is a difference (i.e. diff() ~= 0), error is returned.
if diff(size(U))
    error('Error: Input U is not a square matrix.')
end

% Checks if input U is an upper triangular matrix.
if ~istriu(U)
    error('Error: Input U is not an upper triangular matrix.')
end

% Checks if input b is a column vector with column dimension equal to a
% dimension of the square matrix input U.
if ~(size(U,1) == size(b,1) && size(b,2) == 1)
    error('Error: Input b is not of expected dimensionality.')
end

% Creates a vector x with the same dimensions as input b, initialising all
% elements of x as 0.
x = zeros(size(b));

% Checks if input b does not consist entirely of zero elements.
if x == b
    error('Error: Input b cannot consist entirely of zero elements.')
end

% Performs Back Substitution to calculate each element of vector x.
% ':-1' within the for loop signifies an inverted loop.
for i = length(x):-1 : 1
    x(i) = (b(i) - sum(U(i,i+1:length(x)) * x(i+1:length(x)))) / U(i,i);
end

end