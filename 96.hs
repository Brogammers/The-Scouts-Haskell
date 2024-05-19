import Data.List (find)

-- Type Definitions
type Position = (Int,Int)
data Color = W | B deriving (Eq, Show)
data Peg = Peg Position Color deriving (Eq, Show)
data Move = M Position deriving (Eq, Show)
type Board = [Peg]
data State = S Move Board deriving (Eq, Show)

-- Helper Functions
allPositions :: [Position]
allPositions = [(x,y) | x <- [-3..3], y <- [-3..3], not(abs x == 2 && abs y == 2)  && abs x + abs y <= 4]

getPeg :: Position -> Board -> Maybe Peg
getPeg pos = find (\(Peg p _) -> p == pos)

isWhite :: Position -> Board -> Bool
isWhite pos board = case getPeg pos board of
  Just (Peg _ W) -> True
  _ -> False

neighbours :: Position -> [Position]
neighbours (x,y) = [(x-1,y), (x+1,y), (x,y-1), (x,y+1)]

flipPeg :: Position -> Board -> Board
flipPeg pos board = map (\peg@(Peg p color) -> if p == pos then Peg p W else peg) board

-- Functions
createBoard :: Position -> Board
createBoard pos@(x, y)
  | not (isValidPosition pos) = error "The position is not valid."
  | otherwise = [Peg (a, b) (if (a, b) == pos then W else B) | a <- [-3..3], b <- [-3..3], isValidPosition (a, b)]
  where isValidPosition (x', y') = not(abs x' == 2 && abs y' == 2) && abs x' + abs y' <= 4

isValidPosition :: Position -> Bool
isValidPosition (x, y) = abs x <= 3 && abs y <= 3 && not(abs x == 2 && abs y == 2) && (abs x + abs y) <= 4

isValidMove :: Move -> Board -> Bool
isValidMove (M pos) board = case getPeg pos board of
  Just (Peg _ B) -> any (\p -> isWhite p board) (neighbours pos)
  _ -> False

isGoal :: Board -> Bool
isGoal = all (\(Peg _ color) -> color == W)

showPossibleNextStates :: Board -> [State]
showPossibleNextStates board
  | isGoal board = error "No Possible States Exist."
  | otherwise = [S (M pos) (flipPeg pos board) | (Peg pos B) <- board, isValidMove (M pos) board]