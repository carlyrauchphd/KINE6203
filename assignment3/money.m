function [total] = money(quarters,dimes,nickels,pennies)
%money Calculates money total based on coins
%   Function inputs numbers of quarters, dimes, nickels, pennies and
%   outputs how much money is there
% Inputs:
% quarters = # of quarters
% dimes = # of dimes
% nickels = # of nickels
% pennies = # of pennies
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
quarterCost = 0.25 * quarters;
dimeCost = 0.1 * dimes;
nickelCost = 0.05 * nickels;
penniesCost = 0.01 * pennies;
total = quarterCost+dimeCost+nickelCost+penniesCost;
end