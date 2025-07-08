-- Initialize the Board
local board = { 
    { " ", " ", " ", " ", " ", " ", " " }, 
    { " ", " ", " ", " ", " ", " ", " " }, 
    { " ", " ", " ", " ", " ", " ", " " }, 
    { " ", " ", " ", " ", " ", " ", " " }, 
    { " ", " ", " ", " ", " ", " ", " " }, 
    { " ", " ", " ", " ", " ", " ", " " } 
}

-- Function to print the board on the screen
local function printBoard(b)
    for i = 1, 6, 1 do
        -- for loop sets the i variable to 1 and will iterate through the code 6 times.
        -- Each loop will increase the variable by 1
        -- The print statement uses the pipe to create a board with columns
        print(b[i][1] ..
            "|" .. b[i][2] .. "|" .. b[i][3] .. "|" .. b[i][4] .. "|" .. b[i][5] .. "|" .. b[i][6] .. "|" .. b[i][7])
        -- b[x][y]
        -- b indicates the board
        -- x indicates the reference to the table/row in the array
        -- y indicates the cell in the table
        --      local board = {
        -- Row 1    {" ", " ", " ", " ", " ", " ", " "},
        -- Row 2    {" ", " ", " ", " ", " ", " ", " "},
        -- Row 3    {" ", " ", " ", " ", " ", " ", " "},
        -- Row 4    {" ", " ", " ", " ", " ", " ", " "},
        -- Row 5    {" ", " ", " ", " ", " ", " ", " "},
        -- Row 6    {" ", " ", " ", " ", " ", " ", " "},
        --       } --------------------------------------
        --Columns     1    2    3    4    5    6    7
    end
    print("-------------")
    print("1|2|3|4|5|6|7" .. " column numbers ")
end

-- Function to check if the column has an available space if so return the next available space
local function columnAvailable(column, gameboard)
    for i = 6, 1, -1 do
        -- This checks the board from the bottom up.
        -- check if the cell in the column is empty
        if gameboard[i][column] == " " then
            -- column is available
            return true, i -- Retrun true for availability and i as the location of the empty cell
        end
    end
    -- If the loop finishes without finding an empty cell, column is full
    return false -- Return false for unavailability.
end

-- Function to reference win condition
local function winCondition(a, b, c, d) -- a,b,c,d will be paramaters of the board row and cell
    return a ~= " " and a == b and b == c and c == d -- this logic checks to ensure that the cell is not blank and that all four cells match
end
-- Function to check for win condition on the board
local function checkWin()
    -- Row 1    {" ", " ", " ", " ", " ", " ", " "},
    -- Row 2    {" ", " ", " ", " ", " ", " ", " "},
    -- Row 3    {" ", " ", " ", " ", " ", " ", " "},
    -- Row 4    {" ", " ", " ", " ", " ", " ", " "},
    -- Row 5    {" ", " ", " ", " ", " ", " ", " "},
    -- Row 6    {" ", " ", " ", " ", " ", " ", " "},
    -- Loop through rows of the board starting from row 6 down to row 1 Horizontal check
    for row = 6, 1, -1 do
        for col = 1, 4, 1 do
            -- Loop through columns from 1 to 4 (to check horizontal win conditions)
            -- Check if the current four horizontally adjacent cells meet the win condition
            if winCondition(board[row][col], board[row][col + 1], board[row][col + 2], board[row][col + 3]) then
                -- If a winning condition is met, return true
                return true
            end
        end
    end
    -- Verticle Check Left to Right
    for col = 1, 7, 1 do     -- Loop through the columns of the board from left col 1 to right col 7
        for row = 1, 3, 1 do -- Loop through rows from 1 to 3 (to check vertical win conditions)
            -- Check if the current four vertical adjacent cells meet the win condition
            if winCondition(board[row][col], board[row + 1][col], board[row + 2][col], board[row + 3][col]) then
                -- If a winning condition is met, return true
                return true
            end
        end
    end
    -- Loop to check diagonal win condition left to right
    for row = 1, 3, 1 do     -- loop through rows 1-3 so that it remains in bounds of the grid.
        for col = 1, 4, 1 do -- loop through columns 1-4 as the requirement is only 4 consecutive spots for win
            if winCondition(board[row][col], board[row + 1][col + 1], board[row + 2][col + 2], board[row + 3][col + 3]) then
                -- Check if the current four vertical adjacent cells meet the win condition
                return true -- If a winning condition is met, return true
            end
        end
    end
    -- Loop to check diagonal win condition right to left
    for row = 4, 6, 1 do     -- loop through rows 4-6 so that it remains in bounds of the grid.
        for col = 1, 4, 1 do -- loop through columns 1-4 as the requirement is only 4 consecutive spots for win
            if winCondition(board[row][col], board[row - 1][col + 1], board[row - 2][col + 2], board[row - 3][col + 3]) then
                -- Check if the current four vertical adjacent cells meet the win condition
                return true -- If a winning condition is met, return true
            end
        end
    end
end
local function checkDraw()
    for row = 1, 6, 1 do     -- cycle through each row
        for col = 1, 7, 1 do -- check each column
            if board[row][col] == " " then
                -- if any cell has a space available
                return false
                -- then return false so that the game continues
            end
        end
    end
    return true
end

-- Function for plyer move
local function playerMove(player)
    local validMove = false
    while not validMove do
        print("Player " .. player .. " enter the number of the column you want to drop your coin in: ")
        local column  
        while true do  -- Start an infinite loop to repeatedly ask for input
            io.write("Please enter a number between 1 and 7: ")  -- Prompt the user for input
            column = io.read("*n")  -- Read a number from user input
        
            -- Check if the input is valid: it should be a number and within the range of 1 to 7
            if column and column >= 1 and column <= 7 then
                break  -- Exit the loop if the input is valid
            else
                print("Invalid input. Please try again.")  -- Inform the user that the input was invalid
                io.read()  -- Clear the invalid input from the buffer
            end
        end
        print("You entered: " .. column)  -- Print the valid number entered by the user
        local available, row = columnAvailable(column, board)
        -- capture if the column is available and then set the row that is available.
        -- the columnAvailable() function returns two parameters
        -- so it is importat to sent both parameters when calling the function
        if available == true then
            --if the column is available
            board[row][column] = player
            -- set the player figure on the cell available
            validMove = true
            -- change the validMove to true to end the loop
        else
            print("This column is full")
            -- otherwise, let the player know that the column is full.
        end
    end
end

-- Main game loop - called playGame()
local function playGame()
    local currentPlayer = "X" -- set the current player to start the game
    while true do
        -- while loop to keep the game running as long as a win condition has not been met.
        printBoard(board)
        -- print the current state of the grid on the screen
        playerMove(currentPlayer)
        -- run the player move fuction to allow the game to progress
        if checkWin() then
            -- after the player move has completed, check to see if the game is finished
            printBoard(board)
            -- if the game is won, reprint the board
            print("Player " .. currentPlayer .. " wins!")
            -- Print on the screen which player has won the game.
            break
            -- exit the loop after a player wins the game
        end
        if currentPlayer == "X" then
            currentPlayer = "O"
            -- after the player does their move and the check win
            -- function has confirmed the game is not won
            -- change the current player to the next player.
        else
            currentPlayer = "X"
        end
        if checkDraw() then -- check to see if there is a draw
            printBoard(board)
            print("It's a draw!")
            break -- exit the loop if there is a draw
        end
    end
end

-- Run the game
playGame()
