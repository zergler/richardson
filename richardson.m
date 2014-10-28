%-------------------------------------------------------------------------------
% File:         richardson.m
% Authors:      Igor Janjic
% Description:  Implements Richardson extrapolation.
%               Computes the Richardson extrapolation table for the error
%               formula E(h) = K1*h^2 + K2*h^4 + K3*h^6 + ...
% Inputs:
%   N1          Column vector with initial approximations to start the
%               procedure.
% Outputs:
%   N           Richardson extrapolation table.
%-------------------------------------------------------------------------------

function [N] = richardson(N1)

% Determine n and reserve space for N.
n = size(N1, 1);
N = zeros(n);

% First column of N: N1 values.
for i = 1:n
    N(i, 1) = N1(i, 1);
end

% Other columns of N.
for j = 2:n
    for i = 2:n
        N(i, j) = N(i, j-1) + (N(i, j-1) - N(i-1, j-1))/(4^(j-1) - 1);
    end
end
