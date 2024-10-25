% Carly Rauch
% October 16, 2024
% KINE 6203: Assignment 4
% Code Description: Main script used to take isokinetic strength data over
% three days along with demographic data (subjectID, age, gender, and
% weight) and returns both individual and group metrics.
% Functions Used: importfile.m, genderIsoCalc.m, and dayComparer.m 
%
% Tested and Developed on MATLAB R2024a
% Tested and Developed on Macbook Pro M3 Pro

%% Import File/Data
filename = uigetfile('*.csv','Select CSV file to read'); %prompt is displayed to allow user to click file wanted
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile(filename); %uses importfile.m function to import the file and its data. Outputs are displayed as column vectors.

%% Get Gender Group and Individual isokinetic Strength Mean Data
[maleIsoIndMeans,femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(SubjectID, Gender, Day1, Day2, Day3); %uses the function "genderIsoCalc.m" to get the male and female individual and group isokinetic strength means across the three days of data collection

%% Compare Days of a Subject to Determine Increases in isokinetic Strength
day1toDay2 = dayComparer(SubjectID,Day1,Day2); %uses function "dayComparer.m to output a list of the SubjectIDs that had an isokinetic strength that increased on day 2 from day 1 of collection 
day2toDay3 = dayComparer(SubjectID,Day2,Day3); %uses function "dayComparer.m to output a list of the SubjectIDs that had an isokinetic strength that increased on day 3 from day 2 of collection 

%% Normalize Isokinetic Data and Calculate Group Means
for i = 1:length(SubjectID) %for loop used to loop through each individual subject's data to be normalized by weight on each day
    day1IndMeans(i) = Day1(i)/Weight(i); %divides the day 1 data for a subject by the subject's respective weight - this normalized strength is then saved into day1IndMeans
    day2IndMeans(i) = Day2(i)/Weight(i); %same but for day 2 into day2IndMeans
    day3IndMeans(i) = Day3(i)/Weight(i); %same but for day 3 into day3IndMeans
end

normDay1mean = mean(day1IndMeans); %calculates the group mean for the normalized to weight day 1 isokinetic data
normDay2mean = mean(day2IndMeans); %same but for day 2
normDay3mean = mean(day3IndMeans); %same but for day 3

%% Export Results
%Resizing of variables to be put into table - extra rows of the columns are
%replaced with "NaN"
femaleIsoIndMeans(13,1) = NaN;
maleGroupIsoMean(2:13,1) = NaN;
femaleGroupIsoMean(2:13,1) = NaN;
day1toDay2(13,1) = NaN;
day2toDay3(12:13,1) = NaN;
normDay1mean(2:13,1) = NaN;
normDay2mean(2:13,1) = NaN;
normDay3mean(2:13,1) = NaN;

results = table (maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean,day1toDay2,day2toDay3,normDay1mean,normDay2mean,normDay3mean); %writes the results into a table

writetable(results, 'iso_results.csv') %Writes the table to a csv file called iso_results.csv
