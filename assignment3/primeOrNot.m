function [prime] = primeOrNot(num1)
%primeOrNot Checks if a number is prime or not.
%   If the number inputed (num1) to function is prime, 'true' will be
%   returned. If it is not, 'false' is returned.
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
if isprime(num1) % if input is prime
    prime = 'true'; % output is true
else % if input is not prime
    prime = 'false'; % output is false
end