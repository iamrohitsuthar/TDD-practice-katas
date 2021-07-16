# TicTacToe Checker

If we were to set up a Tic-Tac-Toe game, we would want to know whether the board's current state is solved, wouldn't we? Our goal is to create a function that will check that for us!

Assume that the board comes in the form of a 3x3 array, where the value is 0 if a spot is empty, 1 if it is an "X", or 2 if it is an "O", like so:

```
[[0, 0, 1],
 [0, 1, 2],
 [2, 1, 0]]
```

We want our function to return:

-   -1 if the board is not yet finished AND no one has won yet (there are empty spots)
-   1 if "X" won
-   2 if "O" won
-   0 if it's a cat's game (i.e. a draw)

Now extend the above example for different board sizes. So now board size is of any length where NXN list ( 3 <= N <= 1500)

We will generalize the winning conditions to be the same for every size of the board, so: any full horizontal row of a single symbol, any full vertical row of a single symbol and any of the two diagonals full of a single symbol. For a standard 3x3 there are 8 winning states (3 horizontals, 3 verticals and 2 diagonals), and we can easily see that for a NxN game this number is 2\*N+2.

**Source:**

https://www.codewars.com/kata/tic-tac-toe-checker

https://www.codewars.com/kata/5f5894ee4e485f00287a7040
