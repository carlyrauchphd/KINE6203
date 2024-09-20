function plotVectors(vector1,vector2)
%plotVecotrs Plots two inputted vectors.
%   Takes two vectors as inputs and returns an output of a figure with both
%   vectors. 
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
figure() % Creates new figure
plot(vector1,'b') % plots the first vector
title('Generic Chart Title') % Chart tile 
xlabel('Generic Indpendent Variable Title') % X-axis title
ylabel('Generic Dependent Variable Title') % y-axis title
hold on % Waits so second vector can be plotted
plot(vector2,'r') % plots 2nd vector    
legend('Vector 1','Vector 2') % Legend so you can distinguish which is which
end