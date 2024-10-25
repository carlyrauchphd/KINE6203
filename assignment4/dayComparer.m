function [isoIncrease] = dayComparer(SubjectID,firstDay,secondDay)
% dayComparer Determines if a subject increased in isokinetic%uses functioin "dayComparer.m to output a list of the SubjectIDs that had an isokinetic strength that increased on day 2 from day 1 of collection strength from
% the first day to the second day.
%   3 Inputs - SubjectID (string), firstDay(double), secondDay (double)
%   with firstDay and secondDay being put in chronological order.
%   If the second day input is greater than the first day input, the
%   SubjectID is added to the output isoIncrease (string array)
%
%    Tested and Developed using MATLAB 2024a on MacBook Pro M3Pro on
%    10/24/2024
numberSubjects = length(SubjectID); %determines number of subjects there is data for
k=1; %will be used as index for the output 
for i=1:numberSubjects %for loop to look through each subject
    if secondDay(i)> firstDay(i) %checks if the second day has a higher isokinetic strength from the first
        isoIncrease(k) = SubjectID(i); %adds subjectID to the output varibale in spot "k"
        k=k+1; %moves to the next available spot in the output
    else
        %does nothing because only want if second day > first day
    end
end

isoIncrease = isoIncrease'; %transposes the output from a row vector to a column vector
end 