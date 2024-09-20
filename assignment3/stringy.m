function [letterLength, firstLetter, lastLetter] = stringy(word)
%stringy Finds number of letters, first letter, and last letter of inputed
%word.
%   function finds the number of letters, first letter, and last letter in
%   the word inputed by the user as three separate outputs. Word should be
%   inputed as 'word'
% Written by Carly Rauch on 9/20/2024 
% tested on Macbook Pro running MATLAB version R2024a
word = convertStringsToChars(word); %turns input as string into characters
letterLength = length(word); % gives number of letters in input string
firstLetter = word(1); % finds first letter of inputed word
lastLetter = word(letterLength); % finds last letter of inputed word
end