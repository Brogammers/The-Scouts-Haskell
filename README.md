# Peg Reversal Game
This project implements a simple version of the Peg Reversal game in Haskell.

## Game Description
The Peg Reversal game is played on a hexagonal board with 37 positions. Each position can hold a peg that is either white (W) or black (B). The game starts with one white peg in a specified position and all other positions filled with black pegs. The goal of the game is to turn all the pegs to white.

A move in the game consists of choosing a black peg that has at least one white neighbor and flipping it to white.

## Code Overview
The code defines several types and functions to represent and manipulate the game state:

- `Position`: A pair of integers representing a position on the board.
- `Color`: A data type with two values, W and B, representing white and black.
- `Peg`: A data type representing a peg, which has a position and a color.
- `Move`: A data type representing a move, which is a position to flip.
- `Board`: A list of pegs representing the game board.
- `State`: A data type representing a game state, which includes a move and the resulting board.

### The main functions are:

- `createBoard`: Creates a new game board with one white peg at a specified position and all other pegs black.
- `isValidPosition`: Checks if a position is valid on the board.
- `isValidMove`: Checks if a move is valid in a given board state.
- `isGoal`: Checks if a given board state is a goal state (all pegs are white).
- `showPossibleNextStates`: Given a board state, generates all possible next states.

## How to Run
You can load the code into GHCi (the Haskell interpreter) and call the functions to simulate the game. For example, to create a new board with the white peg at position (0, 0), you can do:

```
let board = createBoard (0, 0)
```
Then, to show all possible next states from this board, you can do:
```
showPossibleNextStates board
```

## Authors

1. Hatem Soliman, 58-6188
2. Tony Makaryous, 58-7496
3. Mohammed Elazab, 58-26108

## License

This project is part of the CSEN403 course provided by the German University in Cairo (GUC). It is managed by the university and is intended for educational purposes. All rights reserved.