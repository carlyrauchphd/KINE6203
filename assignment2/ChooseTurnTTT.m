% Carly Rauch
% Last modified: September 16, 2024
% KINE 6203 Assignment #2: Tic-Tac-Toe

% This code will allow users to play a game of Tic-Tac-Toe against the 
% computer in the command window following prompts as they appear on the screen.
% It begins by asking the user if they want to play. If the user agrees,the
% game presents instructions for the user and will initiate a loop that
% allows the player to play multiple rounds. The player is able to choose
% to play first or second and a game board is presented as a 3x3 matrix in
% the command window. The player and computer will take turns placing their
% symbols ('X' for player and 'O' for the computer) on the board. The game
% will check for a win or draw after each turn using functions (checkWin
% and checkDraw). If a player wins or the game ends in a draw, a message is
% displayed, and the user is askied if they want to play again. The loop
% will continue until the user decides to stop playing. 
% Tested using MATLAB version R2024a on Macbook Pro

% Set up environment by clearing the command window and all variables from
% workspace
clc;
clear;

% Welcome message to ask if the user wants to play
startGame = questdlg('Welcome to Tic-Tac-Toe! Would you like to play a game?', ...
                     'Tic-Tac-Toe', ...
                     'Yes', 'No', 'No');

% If the user selects 'Yes', the game begins
if strcmp(startGame, 'Yes')

    % Instructions Box
    howToPlay = msgbox({'Instructions to play Tic-Tac-Toe:', ...
        '1. You will play as X and the computer will play as O' ...
        '2. Players will take turns putting your character in an empty spot' ...
        '3. The first player to get 3 of their characters in a row (up/down, across, or diagonally) wins' ...
        '4. If all 9 squares are filled and neither player has 3 in a row, the game ends in a draw', ...
        '5. The game will be played in the command window and you will be prompted to make your moves' ...
        '6. Press ok when you have read all of this', ...
        'May the odds be ever in your favor...'}, ...
        'How to Play');
    uiwait(howToPlay); % Keeps instructions box up until pressed ok

    % Main game loop
    playAgain = 'Yes'; % Initializes variable to store user's choice to play again
    
    % Main loop to restart game if playing again is wanted
    while strcmp(playAgain, 'Yes')
        % Ask the player if they want to go first or second
        firstTurn = questdlg('Do you want to go first or second?', ...
                             'First or Second?', 'First', 'Second', 'First');

        % Initialize game board for a new game
        board = ['1','2','3'; '4','5','6'; '7','8','9'];
        player = 'X';   % Human player
        computer = 'O'; % Computer player

        % Determine who goes first based on player's choice
        if strcmp(firstTurn, 'First')
            turn = player;  % Human player goes first
        else
            turn = computer; % Computer goes first
        end

        gameOver = false; % Initializes gameOver variable for upcoming loop

        % Loop for a single game
        while ~gameOver % While the game is not over, still playing
            clc;
            displayBoard(board); % Shows current state

            % Checks whose turn it is
            if turn == player % Human player's turn
                validMove = false; % Initializing variable outside of loop
                while ~validMove  % Ask for valid move
                    move = input('Enter the position (1-9) to place your X and then press enter: ', 's');
                    % Check if the input is a digit and within the valid range
                    if all(isstrprop(move, 'digit')) && str2double(move) >= 1 && str2double(move) <= 9 && ismember(move, board(:)) 
                        %checks if all characters in move are digits, converts string to move and checks if it is between 1 and 9
                        % converts string into number, and then checks if position is available. 
                        validMove = true; % Makes sure the move is valid and selection hasn't already been made
                    else
                        disp('Invalid move. Please enter a number between 1 and 9.'); % If not valid, reask for valid move
                    end
                end
                % Update board with the player's move
                board(board == move) = player;

                % Check if human player has won the game
                if checkWin(board, player)
                    clc;
                    displayBoard(board); % Shows the final game board
                    disp("You win! You're smarter than a computer!"); % Displays win message
                    gameOver = true; % Ends the game
                else
                    turn = computer; % Switches turn to computer
                end
            else
                % Computer's turn
                validMove = false; % Makes sure computer move is valid
                while ~validMove
                    % Computer move gets generated randomly between 1 and 9
                    move = randi([1, 9]);
                    move = num2str(move); % Convert move to string to compare
                    if ismember(move, board(:)) % Ensures move is valid
                        validMove = true; % If the move is valid, proceeds
                    end
                end
                board(board == move) = computer; % Updates game board with move

                % Check if computer won the game
                if checkWin(board, computer)
                    clc;
                    displayBoard(board);
                    disp('Computer wins! AI is taking over...');
                    gameOver = true;
                else
                    turn = player; % Switches turn
                end
            end

            % Checks for draw
            if ~gameOver && checkDraw(board) % Check if gameOver is false and 
                clc;
                displayBoard(board);
                disp("The game is a draw! You're as smart as a computer!");
                gameOver = true;
            end
        end

        % Ask if the user wants to play again with a pop-up dialog
        playAgain = questdlg('Do you want to play again?', ...
                             'Play Again', ...
                             'Yes', 'No', 'No');

        if strcmp(playAgain, 'No') % If user selects "No", exit main loop
            disp('Thanks for playing!');
            break; % Exits the loop
        end
    end

else
    % Exit message if user does not want to play
    disp('I would be scared too! Maybe next time!');
end

%% Function Definitions
function displayBoard(board)
    % Display the Tic Tac Toe board in standard 3 x 3 format
    disp([board(1,1) ' | ' board(1,2) ' | ' board(1,3)])
    disp('---------')
    disp([board(2,1) ' | ' board(2,2) ' | ' board(2,3)])
    disp('---------')
    disp([board(3,1) ' | ' board(3,2) ' | ' board(3,3)])
end

function isWin = checkWin(board, player)
    % Check if a player has won the game
    winPatterns = [1,2,3; 4,5,6; 7,8,9; 1,4,7; 2,5,8; 3,6,9; 1,5,9; 3,5,7];% Defines all winning combinations
    boardVec = board(:)'; % Turns board into vector
    for i = 1:size(winPatterns,1) % This loop checks if any of the winning combos has been made by 1 player
        if all(boardVec(winPatterns(i,:)) == player)
            isWin = true;
            return; % If there's a win by a player, true is returned and the loop is exited
        end
    end
    isWin = false; % If no winning pattern, returns false
end

function isDraw = checkDraw(board)
    % Check if the game ended in a draw
    isDraw = all(board(:) == 'X' | board(:) == 'O'); % Checks that all positions are filled on the game board
end
