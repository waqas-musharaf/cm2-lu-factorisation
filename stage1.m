function [x] = stage1(L, b)

% stage1.m:
% A function which takes as input any size of real, square, unit lower
% triangular matrix 'L' together with an RHS vector 'b' and computes
% and outputs the solution vector 'x' to the triangular system of
% equations Lx = b using forward substitution.

% Author: Waqas Musharaf

% Checks if input L is real (contains only real elements).
if ~isreal(L)
    error('Error: Input L is not real.')
end

% Checks if input L is a square matrix:
% size() returns the dimensions of the input,
% diff() returns the difference between the dimensions returned.
% If there is a difference (i.e. diff() ~= 0), error is returned.
if diff(size(L))
    error('Error: Input L is not a square matrix.')
end

% Checks if input L is a lower triangular matrix.
if ~istril(L)
    error('Error: Input L is not a lower triangular matrix.')
end

% Following the check above, iterates through the diagonal elements of
% input L, to check if input L is a unit lower triangular matrix.
for d = 1 : size(L,1)
    if L(d,d) ~= 1
        error('Error: Input L is not a unit lower triangular matrix.')
    end
end

% Checks if input b is a column vector with column dimension equal to a
% dimension of the square matrix input L.
if ~(size(L,1) == size(b,1) && size(b,2) == 1)
    error('Error: Input b is not of expected dimensionality.')
end

% Creates a vector x with the same dimensions as input b, initialising all
% elements of x as 0.
x = zeros(size(b));

% Checks if input b does not consist entirely of zero elements.
if x == b
    error('Error: Input b cannot consist entirely of zero elements.')
end

% Performs Forward Substitution to calculate each element of vector x.
for i = 1 : length(x)
    x(i) = b(i) - sum(L(i,1:i-1) * x(1:i-1)) / L(i,i);
end

end