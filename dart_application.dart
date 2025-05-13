import 'dart:io';

// المتغيرات الرئيسية
List<String> board = ['1','2','3','4','5','6','7','8','9'];
bool isXTurn = true;
bool gameEnded = false;
int moves = 0;

// التوليفات اللي ممكن تفوز
List<List<int>> winPositions = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
];

void main() {
  print("Welcome to Tic-Tac-Toe Game!");

  // تكرار اللعب لحد ما يخلص
  while (!gameEnded) {
    printBoard();
    playTurn();
    checkWinner();
  }
}

void printBoard() {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('---|---|---');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('---|---|---');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

void playTurn() {
  String currentPlayer = isXTurn ? 'X' : 'O';
  print("Player $currentPlayer, choose a number from 1 to 9:");

  String? input = stdin.readLineSync();
  int? position = int.tryParse(input ?? '');

  if (position == null || position < 1 || position > 9 || board[position - 1] == 'X' || board[position - 1] == 'O') {
    print("Invalid move. Try again.");
    playTurn(); // إعادة المحاولة
  } else {
    board[position - 1] = currentPlayer;
    isXTurn = !isXTurn;
    moves++;
  }
}

void checkWinner() {
  for (var combo in winPositions) {
    String a = board[combo[0]];
    String b = board[combo[1]];
    String c = board[combo[2]];
    if (a == b && b == c) {
      printBoard();
      print("Player $a wins!");
      gameEnded = true;
      return;
    }
  }

  if (moves == 9) {
    printBoard();
    print("It's a draw!");
    gameEnded = true;
  }
}
