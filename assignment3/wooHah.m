function [word] = wooHah(num1,num2)
%wooHAH Checks if sum of 2 numbers is even or odd.
%   Function inputs two numbers (num1,num2) and returns 'Woo' or 'Hah'
%   depending on if the sum is even or odd. The sum is found to be even or
%   odd by checking what the remainder of the sum is when it is divided by
%   2 as even numbers are divisible by 2 (making remainder 0) and odd
%   numbers are not. 
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
sum = num1 + num2; % Adds two values inputed together
remainder = rem((sum),2); % Finds the remainder of the two values if divided by 2
if remainder == 0; % If remainder = 0, sum is even
    word = 'Woo'; % Returns 'Woo'
else % If remainder is not 0, sum is odd
    word = 'Hah'; % Returns 'Hah
end