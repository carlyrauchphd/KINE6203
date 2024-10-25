function [maleIsoIndMeans,femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(SubjectID, Gender, day1, day2, day3)
% genderIsoCalc This function calculates the individual and group means for
% isokinetic strength data based on gender.
%    5 Inputs = SubjectID (string), gender(string) and subject's day1,day2,
%    day3 isokinetic strength data (all doubles). This function utilizes a
%    for loop to go through each individual subject's data and find their
%    average over the 3 days. It then uses these calculated individual
%    means by gender to calculate the group means for each gender. 
%    4 Outputs = maleIsoIndMean, femaleIsoIndMean, maleGroupIsoMean,
%    femaleGroupIsoMean
%    
%    Tested and Developed using MATLAB 2024a on MacBook Pro M3Pro on
%    10/24/2024
numberSubjects = length(SubjectID); % Sees the number of subjects in dataset
maleSub = 1; %sets male subject number to 1 for for loop
femaleSub = 1; %same but for female subjects
maleIsoIndMeans = []; %empty array to store individual male means
femaleIsoIndMeans = []; %empty array to store individual female means
for i=1:numberSubjects %for loop to go through the subjects
    if Gender(i) == "M" %if the gender is male
        maleIsoIndMeans(maleSub) = mean([day1(i),day2(i),day3(i)]); %calculates mean for each male subject over the three days
        maleSub = maleSub + 1; %will go to next male subject
    elseif Gender(i) == "F" %if the gender is female
        femaleIsoIndMeans(femaleSub) = mean([day1(i),day2(i),day3(i)]);  %calculates mean for each female subject over the three days
        femaleSub = femaleSub + 1; %will go to next female subject
    end
end

maleGroupIsoMean = mean(maleIsoIndMeans, "all"); %calculates the male group mean
femaleGroupIsoMean = mean(femaleIsoIndMeans, "all"); %calculates the female group mean
maleIsoIndMeans = maleIsoIndMeans'; %transposes the male group means from row vector to column vector
femaleIsoIndMeans = femaleIsoIndMeans'; %transposes the female group means from row vector to column vector

end