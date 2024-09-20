function [sum,difference,product,maximum] = mathCalculations(num1,num2)
%mathCalculations Takes various calculatons using two numbers inputed by
%user.
%   Function inputs two numbers(num1,num2) and returns 4 outputs (sum,
%   difference, product, maximum)
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
sum = num1 + num2; % Adds numbers inputed together
difference = num1 - num2; % Subtracts numbers that were inputed
%does order matter?
product = num1*num2; % Multiples numbers inputed
maximum = max(num1,num2) % Finds which of the two values are larger that are inputed
end