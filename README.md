#### README for Connect Four Game in Lua

---

### Overview

This project is a **Connect Four** game implemented in Lua. Connect Four is a classic two-player connection game where players take turns dropping colored discs into a vertical grid. The objective is to be the first to form a horizontal, vertical, or diagonal line of four of one's own discs.

This Lua script provides a simple command-line interface for two players to play Connect Four on a 7-column by 6-row board.

---

### Features

- **Board Initialization:** Creates a 6x7 grid represented as a 2D Lua table.
- **Board Display:** Prints the current state of the board with column numbers for easy reference.
- **Player Input:** Prompts players to enter the column number where they want to drop their disc.
- **Move Validation:** Checks if the selected column has space available.
- **Win Detection:** Detects horizontal, vertical, and diagonal wins.
- **Draw Detection:** Detects when the board is full without any winner.
- **Turn Alternation:** Alternates turns between Player "X" and Player "O".
- **Game Loop:** Runs continuously until a player wins or the game ends in a draw.

---

### How the Code Works

1. **Board Setup:**
   - The board is a 6-row by 7-column grid initialized with empty spaces `" "`.

2. **Printing the Board:**
   - The `printBoard` function prints each row with vertical bars `|` separating columns.
   - Column numbers (1 to 7) are displayed below the board for player reference.

3. **Player Moves:**
   - The `playerMove` function prompts the current player to enter a column number.
   - It validates the input to ensure it is a number between 1 and 7.
   - It checks if the column has space using `columnAvailable`.
   - If valid, it places the player's marker ("X" or "O") in the lowest available row of that column.

4. **Win Condition Checking:**
   - The `checkWin` function scans the board for four consecutive identical markers horizontally, vertically, and diagonally.
   - The helper function `winCondition` checks if four given cells are the same non-empty marker.

5. **Draw Condition Checking:**
   - The `checkDraw` function checks if all cells are filled without any winner.

6. **Game Loop:**
   - The `playGame` function manages the game flow.
   - It alternates between players, prints the board, accepts moves, and checks for win/draw conditions.
   - The game ends when a player wins or the board is full (draw).

---

### How to Use

1. **Prerequisites:**
   - You need to have Lua installed on your system. You can download it from [https://www.lua.org/download.html](https://www.lua.org/download.html).

2. **Running the Game:**
   - Save the Lua script to a file, for example, `connect_four.lua`.
   - Open your terminal or command prompt.
   - Navigate to the directory containing the script.
   - Run the game by typing:
     ```
     lua connect_four.lua
     ```
3. **Playing the Game:**
   - The game will display an empty board and prompt Player X to enter a column number (1-7).
   - Enter the column number where you want to drop your disc.
   - The game will update the board and prompt Player O for their move.
   - Continue alternating turns until a player wins or the game ends in a draw.
   - The game will announce the winner or if the game is a draw.

---

### Example Gameplay

```
 | | | | | | | 
 | | | | | | | 
 | | | | | | | 
 | | | | | | | 
 | | | | | | | 
 | | | | | | | 
-------------
1|2|3|4|5|6|7 column numbers 
Player X enter the number of the column you want to drop your coin in: 
Please enter a number between 1 and 7: 4
You entered: 4
 | | | | | | | 
 | | | | | | | 
 | | | | | | | 
 | | | | | | | 
 | | | | | | | 
 | | |X| | | | 
-------------
1|2|3|4|5|6|7 column numbers 
Player O enter the number of the column you want to drop your coin in: 
...
```

---

### Notes

- The game runs entirely in the terminal.
- Input validation ensures players cannot enter invalid columns or place discs in full columns.
- The board is displayed after every move for easy tracking.
- The game ends automatically when a player wins or the board is full.

---

### Contributing

Feel free to fork this repository and improve the game! Possible enhancements include:

- Adding AI for single-player mode.
- Improving the user interface.
- Adding color output for better visualization.
- Implementing undo moves.

---

Enjoy playing Connect Four in Lua! 🎉
