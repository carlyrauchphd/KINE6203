%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 1: Matlab Scavenger Hunt and HelloWorld
%
% Submitted by: Carly Rauch
%
% Due: August 31, 2023
%
% Instructions: 

% There are two parts to this assignment. Part 1 deals with using the
% Matlab documentation to answer some questions or perform some tasks. Part
% 2 involves you writing your very first Matlab program!!

% Please write all of your responses in the following .mfile.
% If there are comments after the question (as in question 2) please 
% write your answer inside those comments. If there are not comments
% please write your answer with correct matlab syntax. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Part 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. Set the url of the matlab documentation to a variable called helpURL

helpURL = 'https://www.mathworks.com/help/matlab/';

% 2. What does the command 'clear all' do?
%
% Clear all removes all of the variables in the current workspace.
%


% 3. Find a matlab function to take the average of the following
% numbers [1 7 21 32 67 32453]? Store your answer in a variable called
% averageAnswer.
A = [1 7 21 32 67 32453];
averageAnswer = mean(A);

% 4. What command would you type to see a list of all installed toolboxes?

        %ver

% 5. Write some commands that would return a list of all of the available 
% functions in the image processing toolbox? 

help images
doc images

% 6. On the line below figure, write a command to draw a graph of 
% x and y. 

x = linspace(-2*pi,2*pi);
y = sin(x);

figure
plot(x,y)
title("y vs. x")
xlabel('x')
ylabel('y')
     

% 7. Find a function that performs a statistical test you've seen used
% in a journal article (there are many possible answers to this). What does
% this function do and how would you use it?

%
% Answer: One statistical test I've seen commonly used in journal articles
% pertaining to my area of study is paired t-tests. I personally would use
% this in the realm of ACLR and its effects on the individual's
% biomechanics. Since this type of testing is used to denote if the means
% of two paired measurements are statistically significant, I would
% personally use it to compare measurements such as knee range of motion,
% peak knee flexion, quad muscle activation levels, etc. either before and
% after surgery or between the affected and contralateral limb to determine
% the amount of recovery completed. The matlab function that I could use
% for this testing is called 'ttest'. My code would read as:
% beforeACLR = [ #, #, #];
% afterACLR = [ #, #, #];
% [h, p_value, ci, stats] = [beforeAClR, afterACLR];
% where h is 0 or 1, to reject or accept null hypothesis, p_value is the p
% value, ci is the confidence interval, and stats will be a struct that
% gives extra info like standard dev., degrees of freedom, and t-statistic
%

% 8. What are the 2 major types of loops that MATLAB supports? What is the
% difference between them?

%
% Answer: The 2 major types of loops are for loops and while statement loops.
%For statements loop a specific number of time (keeps track of the
%interatioins through the use of an incrementing index variable) and while
%statement loops continue as long as that condition remains true. 
% 


% 9. What does NaN stand for? Give an example of when you would get NaN as
% an answer. 

%
% Answer: "NaN" stands for "Not a Number". You would get this when values
% that aren't real or a complex number. Operatiions such as 0/0 or
% infinity/infinity would return NaN as the answer. 
%


% 10. The following code snippet executes but contains an error (we don't
% get a useful answer). See if you can use the documentation to fix the 
% error to get the sum of the numbers in A. Do not change or remove 
% any of the values in A.

A = [1 2 3 2 1 NaN 1 2 3 NaN];
S = nansum(A);


% 11. I used to love playing the game minesweeper. Is there a way that I
% could play a similar game on Matlab? Write the command that would launch
% the game if so. 

xpbombs %from matlab documentation / comments


% 12. Create a variable myAge and assign it the value of your age. Then 
% create a new variable called ageLessTwo and subtract two from the value of the
% myAge variable. Create a third variable called agePlusOne and add one to 
% the value of the myAge variable.

myAge = 21;
ageLessTwo = myAge - 2;
agePlusOne = myAge + 1; 

% 13. Use the built-in function namelengthmax to find out the maximum number of
% characters that you can have in an identifier name under your version of
% MATLAB. Assign the value to a variable called maxNameLength.

maxNameLength = namelengthmax; % my version = 63


% 14. You need to convert some weight values from metric to standard units. 
% Create two appropriately named variables to store the original weight in 
% pounds and the original weight in ounces respectively. Use who and whos 
% to see the variables. Clear one of your variables and then use who and whos again.

originalWeightKg = 100;
% Add your code on the next line
originalWeightLb = originalWeightKg * 2.20462;
originalWeightOz = originalWeightKg * 35.274;
who %display list of variables
whos %display info on variables
clear originalWeightOz
who
whos

% 15. Assign a number with a decimal place to an appropriately named variable. Convert the
% variable to the type int32 and store the result in a new variable (hint: this is known
% as casting in computer programming). Use whos to check your result. 

dnumber = 1.23;
dnumber32 = int32(dnumber);
whos


% 16. Create a variable called weightInLBs to store a weight in pounds. Convert this to 
% kilograms using an appropriate calculation or function and assign the result to a variable weightInKgs.

weightInLBs = 120;
weightInKgs = weightInLBs*0.453592;


% 18. Create a variable fTemp to store a temperature in degrees Fahrenheit (F). 
% Convert this to degrees Celsius (C) using an appropriate 
% calculation and store the result in a variable cTemp.

fTemp = 65;
cTemp = (fTemp - 32) * (5/9);



% 19. Using the colon operator, create the following row vectors:
% 2 3 4 5 6 7 
% 1.1000 1.3000 1.5000 1.7000 
% 8 6 4 2
% Store your results with variable names vecA, vecB and vecC respectively.
vecA = linspace(2,7,6); %used linspace before, hope that's okay
vecB = 1.1:0.2:1.7;
vecC = linspace(8,2,4);


% 20. Give a MATLAB expression that would create a vector 
% (assigned to a variable called vec) of 50 elements that range, equally spaced, 
% from 0 to 2pi. 

vec = linspace(0,2*pi,50);


% 21. Using the colon operator and the transpose operator, 
% create a column vector that has the values -1 to 1 in steps of 0.5.
% Assign your answer to a variable called colVec.

columns = -1:0.5:1;
colVec = (columns)';


% 22. Create a variable called rows that is a random integer in the inclusive range 
% from 1 to 5. Create a variable called cols that is a random integer in the 
% inclusive range from 1 to 5. Create a matrix called resultMat of all zeros with the 
% dimensions given by the values of rows and cols. The resultMat should
% change each time you execute your code. 

rows = randi([1,5]);
cols = randi([1,5]);
resultMat = zeros(rows,cols);
disp(resultMat); %did for checking

% 23. Create a vector of five random integers, each in the inclusive range 
% from -10 to 10 assigned to a variable named originalVec. Perform each of 
% the following on the original vector and store your results in appropriately 
% named variables. (you should have a seperate line of code for each)
originalVec = randi([-10 10],1,5);
% - subtract 3 from each element
subtractVec = originalVec - 3;

% - count how many are positive
positive = sum(originalVec>0);

% - get the absolute value of each element
absVal = abs(originalVec);


% - find the maximum.
maximum = max(originalVec);


% 24. Write some code that will calculate the area of a trapezoid. Create
% variables for base1, base2, and height and assign them values. Store the
% result of your calculation in a variable called trapArea. Comment your
% code so that another user can understand what your code does. 

base1 = 5; %enter in one base of the trapzoid   
base2 = 10; %enter in other base of the trapezoid
height = 7; %enter in the height of the trapezoid
trapArea = ((base1+base2)/2)+height; %calculates area using the input you provided



% 25. In sports marketing and other areas of sports management, 
% ROI (return on investment) is a key metric when making organizational 
% decisions. The classic equation for ROI is:

% ROI = (Total Revenues – Total Costs) / Total Costs x 100

% Write some code that prompts the user to input total revenues and total 
% costs and then calculates the ROI and stores the value in a variable called
% ROI.


totalRevenue = input('Enter Total Revenues:');
totalCosts = input('Enter Total Costs:');
ROI = ((totalRevenue - totalCosts)/ totalCosts) * 100;


%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%  Part 2: Hello World %%%%%%%%%%%%%%%%%%%%%%%%%%

% Write some code that will print the string 'Hello World' to the screen. 
% There are several ways that you could do this. For an extra challenge, 
% make your program able to take text input from the user and output 
% whatever they input. (For ease of running and executing your solution for 
% part 2, make sure you click the Run Section button vs the Run button) 

%%% Enter the code for your program below this line


disp('Hello World');
fprintf('Hello World\n');
msgbox('Hello World');

user_input = input('Enter something here:', 's')
disp(['You entered:', user_input]);


%%%%% When you have completed everything, type the following two commands
%%%%% (without comments) into your command window. 

%%% load handel
%%% sound(y, Fs)