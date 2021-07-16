import 'package:tic_tac_toe_checker/tic_tac_toe_checker.dart';
import 'package:test/test.dart';

void main() {
  var ticTacToeChecker = TicTacToeChecker();
  test(
    'Given an unsolved 3X3 board, when the getBoardState is called, then -1 is returned',
    () {
      var boardState = ticTacToeChecker.getBoardState(
        [
          [0, 0, 1],
          [0, 1, 2],
          [2, 1, 0]
        ],
      );
      expect(boardState, -1);
    },
  );

  test(
    'Given a solved 3X3 board with a player won in row, when getBoardState is called, then that player number is returned',
    () {
      var boardState = ticTacToeChecker.getBoardState(
        [
          [1, 1, 1],
          [0, 0, 2],
          [2, 1, 0]
        ],
      );
      expect(boardState, 1);
      boardState = ticTacToeChecker.getBoardState(
        [
          [1, 2, 1],
          [1, 1, 1],
          [2, 1, 0]
        ],
      );
      expect(boardState, 1);
      boardState = ticTacToeChecker.getBoardState(
        [
          [2, 2, 2],
          [0, 1, 2],
          [2, 1, 0]
        ],
      );
      expect(boardState, 2);
      boardState = ticTacToeChecker.getBoardState(
        [
          [2, 2, 1],
          [1, 0, 1],
          [2, 2, 2]
        ],
      );
      expect(boardState, 2);
    },
  );

  test(
    'Given a solved 3X3 board with a player won in column, when getBoardState is called, then that player number is returned',
    () {
      var boardState = ticTacToeChecker.getBoardState(
        [
          [1, 2, 1],
          [1, 2, 1],
          [1, 1, 0]
        ],
      );
      expect(boardState, 1);
      boardState = ticTacToeChecker.getBoardState(
        [
          [2, 2, 1],
          [1, 2, 1],
          [2, 2, 1]
        ],
      );
      expect(boardState, 2);
    },
  );

  test(
    'Given a solved 3X3 board with a player won in diagonal, when getBoardState is called, then that player number is returned',
    () {
      var boardState = ticTacToeChecker.getBoardState(
        [
          [2, 0, 2],
          [1, 2, 1],
          [2, 2, 1]
        ],
      );
      expect(boardState, 2);
      boardState = ticTacToeChecker.getBoardState(
        [
          [1, 2, 0],
          [2, 1, 0],
          [1, 0, 1]
        ],
      );
      expect(boardState, 1);
    },
  );

  test(
    'Given a solved 3X3 board with draw, when getBoardState is called, then 0 is returned',
    () {
      var boardState = ticTacToeChecker.getBoardState(
        [
          [2, 1, 2],
          [2, 1, 2],
          [1, 2, 1],
        ],
      );
      expect(boardState, 0);
    },
  );

  test(
    'Given a solved 4X4 board with a player won in row, when getBoardState is called, then that player number is returned',
    () {
      var boardState = ticTacToeChecker.getBoardState(
        [
          [1, 1, 1, 0],
          [0, 1, 2, 0],
          [2, 2, 2, 2],
          [2, 1, 0, 2],
        ],
      );
      expect(boardState, 2);
      boardState = ticTacToeChecker.getBoardState(
        [
          [1, 1, 1, 1],
          [0, 1, 2, 0],
          [2, 1, 1, 2],
          [2, 0, 0, 1],
        ],
      );
      expect(boardState, 1);
    },
  );

  test(
    'Given a solved 10X10 board with a player won in row, when getBoardState is called, then that player number is returned',
    () {
      var boardState = ticTacToeChecker.getBoardState(
        [
          [1, 2, 1, 1, 1, 1, 1, 1, 2, 2],
          [2, 1, 2, 2, 2, 2, 1, 2, 2, 2],
          [2, 1, 2, 2, 2, 2, 2, 1, 1, 1],
          [2, 1, 2, 1, 1, 1, 2, 2, 1, 1],
          [1, 2, 1, 2, 1, 1, 1, 2, 1, 2],
          [2, 2, 1, 1, 2, 2, 2, 1, 2, 2],
          [2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
          [2, 2, 1, 2, 2, 2, 1, 2, 2, 2],
          [1, 2, 1, 1, 1, 1, 1, 1, 1, 2],
          [2, 2, 2, 1, 1, 1, 1, 1, 1, 1]
        ],
      );
      expect(boardState, 2);
    },
  );
}
