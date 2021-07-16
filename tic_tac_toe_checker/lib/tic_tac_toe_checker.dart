class TicTacToeChecker {
  int _winner = -1;

  int getBoardState(List<List<int>> board) {
    if (_isRowWon(board) || _isColumnWon(board) || _isDiagonalWon(board)) {
      return _winner;
    }
    // if board is incomplete means game is still in progress
    if (_isBoardIncomplete(board)) return -1;
    // draw game
    return 0;
  }

  bool _isRowWon(List<List<int>> board) {
    for (var row in board) {
      if (_checkGameWon(row)) {
        _winner = row[0];
        return true;
      }
    }
    return false;
  }

  bool _isColumnWon(List<List<int>> board) {
    var columns = _getColumns(board);
    for (var column in columns) {
      if (_checkGameWon(column)) {
        _winner = column[0];
        return true;
      }
    }
    return false;
  }

  bool _isDiagonalWon(List<List<int>> board) {
    var diagonals = _getDiagonals(board);
    for (var diagonal in diagonals) {
      if (_checkGameWon(diagonal)) {
        _winner = diagonal[0];
        return true;
      }
    }
    return false;
  }

  bool _isBoardIncomplete(List<List<int>> board) {
    return board.any((row) => row.contains(0));
  }

  bool _checkGameWon(List<int> row) {
    var firstElement = row[0];
    if (firstElement == 0) return false;
    return row.every((element) => firstElement == element);
  }

  List<List<int>> _getColumns(List<List<int>> board) {
    var columns = <List<int>>[];
    for (var columnIndex = 0; columnIndex < board[0].length; columnIndex++) {
      columns.add(_getColumn(columnIndex, board));
    }
    return columns;
  }

  List<int> _getColumn(int columnIndex, List<List<int>> board) {
    var column = <int>[];
    for (var rowIndex = 0; rowIndex < board.length; rowIndex++) {
      column.add(board[rowIndex][columnIndex]);
    }
    return column;
  }

  List<List<int>> _getDiagonals(List<List<int>> board) {
    var diagonals = <List<int>>[[], []];
    var topLeftToBottomRightDiagonalPointer = 0;
    var topRightToBottomLeftDiagonalPointer = board[0].length - 1;
    for (var rowIndex = 0; rowIndex < board.length; rowIndex++) {
      diagonals[0].add(board[rowIndex][topLeftToBottomRightDiagonalPointer++]);
      diagonals[1].add(board[rowIndex][topRightToBottomLeftDiagonalPointer--]);
    }
    return diagonals;
  }
}
