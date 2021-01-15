function [x] = stage4(A, b)

% stage4.m:
% A function which solves a square system of linear equations Ax = b using
% the LU factorisation method. It takes as input any size of real, square
% matrix 'A' together with a RHS vector 'b' and outputs the solution
% vector 'x', if it exists.

% Author: Waqas Musharaf

% Uses the stage3.m function with an input of the input matrix A to
% compute the factorised components 'L' and 'U':

% As stage3.m employs checks to confirm its input is valid, this function
% (stage4.m) does not require additional input validation at this stage.
[L, U] = stage3(A);

% Checks if input A does not have a zero determinant (is not rank
% deficient):

% This is achieved by calculating the product of the products of the
% diagonal values of the factorised components 'L' and 'U' of matrix A.
if prod(diag(L)) * prod(diag(U)) ~= 0    
    
    % Uses the stage1.m function with inputs of matrix L and input vector
    % b to compute the solution vector 'y' to the triangular system of
    % equations Ly = b using forward substitution.   
    
    % As stage1.m employs checks to confirm its inputs are valid, this
    % function (stage4.m) does not require additional input validation at
    % this stage.
    [y] = stage1(L, b);
    
    % Uses the stage2.m function with inputs of matrix U and vector y
    % to compute the solution vector 'x' to the triangular system of
    % equations Ux = y using back substitution.
    
    % As stage2.m employs checks to confirm its inputs are valid, this
    % function (stage4.m) does not require additional input validation at
    % this stage.    
    [x] = stage2(U, y);
    
    % Vector x is also the solution vector to the square system of linear
    % equations Ax = b, and is returned as the output of this function.
else 
    error('Error: Input A cannot have a zero determinant.')
end

end