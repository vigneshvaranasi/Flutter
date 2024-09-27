import 'package:flutter/material.dart';

void main() => runApp(const TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tic Tac Toe",
      home: TicTacToe(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> board = List.filled(9, '', growable: false);
  String gameResult = '';
  bool isXTurn = true; // "X" will start first

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Tic Tac Toe Game"),
        backgroundColor: const Color.fromARGB(255, 254, 210, 79),
      ),
      body: gamePlan(),
    );
  }

  Widget gamePlan() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _handleTap(index: index),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 233, 233),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    board[index],
                    style: const TextStyle(fontSize: 48, color: Colors.amber),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            gameResult,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        ElevatedButton(
          onPressed: _resetGame,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            backgroundColor: const Color.fromARGB(255, 254, 210, 79),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Text("Reset Game",style: TextStyle(color: Colors.black),),
        ),
        const SizedBox(height: 20), // To prevent overflow when the keyboard opens
      ],
    );
  }

  void _handleTap({required int index}) {
    if (board[index] == '' && gameResult == '') {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
        gameResult = _checkWinner();
      });
    }
  }

  String _checkWinner() {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == board[pattern[1]] &&
          board[pattern[1]] == board[pattern[2]] &&
          board[pattern[0]] != '') {
        return '${board[pattern[0]]} Wins';
      }
    }

    if (!board.contains('')) {
      return 'It\'s a Draw';
    }
    return '';
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '', growable: false);
      gameResult = '';
      isXTurn = true;
    });
  }
}
