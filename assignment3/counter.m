function counter(num1,num2)
%counter Counts from lower number to higher
%   Takes 2 numerical inputs and will count by one from the smaller input
%   to the larger input. 
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
if num1 < num2 % if the first inputed is smaller than the second input
    disp(num1) % number is displayed
    while num1 < num2 % while the first input is smaller than the second..
        num1 = num1+1; % one is added to the smaller input
        disp(num1) % updated smaller input is displayed
    end 
else % if second input is smaller
    disp(b) % display the second input
    while num2 < num1 % while the second input is smaller than the first
        num2 = num2 + 1; % one is added to the smaller input
        disp(num2) % updated small input displayed
    end
end
end