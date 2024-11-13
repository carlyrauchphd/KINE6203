function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Carly Rauch
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

% (1) BUG FOUND!!: No indentations to be found originally :(. I went ahead
% and indented what all needed to be indented. 

while level ~= beginner && level ~= moderate && level ~= advanced
% (2) BUG FOUND!!: while level ~= beginner || level ~= moderate || level ~=
% advanced will always be true since a variable can't possible be equal to
% all three values. To fix, I changed the ors (||) to ands (&&). This bug
% was found while I was reading through. 
    fprintf('Sorry, that is not a valid level selection.\n')
    level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner % (3) BUG FOUND!!: I found this by trying to run the code and getting a incorrect use of '=' error message. I fixed it by adding proper notation with a double equals sign so that it wouldn't try and assign it to a variable.                     

    highest = beginnerHighest;

elseif level == moderate

    highest = moderateHighest;

else
    highest = advancedHighest; % (4) BUG FOUND!!: changed "advancedhighest" to "advancedHighest". Found this by testing the code and ending up in an infinite loop. Capitalization matters and affects how variables are called in the code.         
end

% randomly select secret number between 1 and highest for level of play

% (5) BUG FOUND!!: secretNumber = floor(rand() + 1 * highest); is not the
% proper way to choose a random number in the bounds, realized through
% proofreading through code. The way set up makes it so that the highest
% number is always the secretNumebr Changed so that it would select a
% random number between 1 and the highest for that level.
secretNumber = randi([1,highest]); 

% initialize number of guesses and User_guess

numOfTries = 1;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber %(6) BUG FOUND!! No end to end this while loop, end added at the end of the loop. Found by running.

% get a valid guess (an integer from 1-Highest) from the user

    fprintf('\nEnter a guess (1-%d): ', highest);
    userGuess = input('');
% (7) BUG FOUND!! while userGuess < 1 || userGuess >= highest does not
% allow the highest as a valid guess which it should allow. Found through
% trying the code.
    while userGuess < 1 || userGuess > highest

        fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

        userGuess = input('');

    end % of guess validation loop
    
% add 1 to the number of guesses the user has made

% (8) BUG FOUND!!: "numOfTries = numOfTries + 1;" Is not in the correct spot.
% It should be located after the user's guess is noted as incorrect. Found
% this bug through reading through the code.

% report whether the user's guess was high, low, or correct

% (9) BUG FOUND!!: if userGuess > secretNumber  Inequality sign is wrong,
% should be other way to match the commentary given. Found through
% proofreading.
    if userGuess < secretNumber
        fprintf('Sorry, %d is too low.\n', userGuess);
        numOfTries = numOfTries + 1;
    elseif userGuess > secretNumber 
        fprintf('Sorry, %d is too high.\n', userGuess);
        numOfTries = numOfTries + 1;
    elseif numOfTries == 1 && userGuess == secretNumber
%(10) BUG FOUND!!: "elseif numOfTries == 1" doesn't compare the
%userGuess to the secretNumber to see if they actually got it on the
%first try. Modified this line to do a comparison. 
        fprintf('\nLucky You!  You got it on your first try!\n\n');
    else
        fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
        secretNumber, numOfTries);
%(11) BUG FOUND!!: Originally this statement didn't include the variable to
%denote how many guesses it took the user to guess the secretNumber. To fix
%this, I included numOfTries variable in the print statement. Found through
%running the code and not getting the message. 

% (12) BUG FOUND!!: This statement "fprintf('Game Over. Thanks for playing
% the Guess That Number game.\n\n');" is in the wrong spot. It should be
% outside of the game loop so I moved it to that location. Found
% through proofreading.

    end  % of guessing while loop

end % Actually ends the whole while loop for the game

fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

% end of game