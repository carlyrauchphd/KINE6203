function [valid] = validTriangle(sides)
%validTriangle Indicates if a triangle is valid.
%   Function that inputs a single 3 element array and returns a logical
%   operator of 1 if the triangle is valid or 0 if the triangle is not.
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
sort(sides); % Will put the array input in order from smallest to largest
sumSides = sides(1)+sides(2); % Takes sum of small sides
valid = sumSides > sides(3); % Returns 1 if small sides sum is greater than the large side, 0 if it is not
end