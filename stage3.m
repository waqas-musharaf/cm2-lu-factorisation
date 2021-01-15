function [L, U] = stage3(A)

% stage3.m:
% A function which takes as input any size of real, square matrix 'A' and
% computes and outputs the factorised components 'L' and 'U' such that
% LU = A.

% Author: Waqas Musharaf

% Checks if input A is real (contains only real elements).
if ~isreal(A)
    error('Error: Input A is not real.')
end

% Checks if input A is a square matrix:
% size() returns the dimensions of the input,
% diff() returns the difference between the dimensions returned.
% If there is a difference (i.e. diff() ~= 0), error is returned.
if diff(size(A))
    error('Error: Input A is not a square matrix.')
end

% Checks if input A is not a triangular matrix.
if (istril(A) || istriu(A))
    error('Error: Input A cannot be a triangular matrix.')
end

% Creates a matrix L with the same dimensions as input A, initialising all
% elements of L as 0, except diagonal values, which are initialised as 1.
L = eye(size(A));
% Creates a matrix U with the same dimensions as input A, initialising all
% elements of U as 0.
U = zeros(size(A));

% Iterates through all rows/columns of matrix A:
for i = 1 : size(A,1)
    % Iterates through each element of the current row in matrix U:
    for e = i : size(U,1)
        % Creates a temporary vector 'temp' which stores the outputs of
        % the element-wise multiplications of the current row in matrix L
        % and the current column in matrix U.
        temp = L(i,1:size(U,1)) .* U(1:size(U,1),e)';
        % Using the temporary vector above, calculates and reassigns the
        % current element of matrix U.
        U(i,e) = (A(i,e) - sum(temp))/ L(i,i);
    end
    % Iterates through each element of the current column in matrix L:
    for e = i + 1 : size(L,1)
        % Creates a temporary vector 'temp' which stores the outputs of
        % the element-wise multiplications of the current row in matrix L
        % and the current column in matrix U.
        temp = L(e,1:size(L,1)) .* U(1:size(L,1),i)';
        % Using the temporary vector above, calculates and reassigns the
        % current element of matrix L.
        L(e,i) = (A(e,i) - sum(temp)) / U(i,i);
    end    
end

end