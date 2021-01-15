The .m files are a Matlab implementation of the LU factorisation method for solving large, square systems of linear equations. They follow the following specification:

Stage 1: Write a Matlab function that will take as input any size of real, square, unit lower triangular matrix L together with a right-hand-side vector b and which computes and outputs the solution x to the triangular system of equations Lx = b using forward substitution. Your function should employ, as a minimum, checks for dimensional compatibility and deal with incompatible cases appropriately. Your function should have the header:
function [x] = stage1(L, b)

Stage 2: Modify the Matlab function written for Stage 1 to take as input any size of real, square, upper triangular matrix U together with a right-hand-side vector b and which computes and outputs the solution x to the triangular system of equations Ux = b using back substitution. All checks should be updated appropriately. Your function should have the header:
function [x] = stage2(U, b)

Stage 3: Write a Matlab function that will take as input any size of real, square matrix A and which computes and outputs the factorised components L and U such that LU = A. You must implement the factorisation method taught in the module and not use any in-built function in Matlab. Relevant checks should be made where required. Your function should have the header:
function [L U] = stage3(A)

Stage 4: Write a Matlab function that solves a square system of linear equations Ax = b using the LU factorisation method. You should take as input any size of real, square matrix A and right-hand-side vector b and output the solution x if it exists. Your function should employ checks for dimensional compatibility and deal with incompatible cases appropriately. You should:
1. Use stage3.m to factorise your matrix into its L and U components. (See note below if you have not managed to do this)
2. You should calculate the determinants of the triangular factors to determine whether a solution to the system of equations exists
3. If a solution does not exist your function should display an appropriate message. If a solution does exist, it should be determined using your stage1.m and stage2.m functions.

Your function should have the header:
function [x] = stage4(A, b)