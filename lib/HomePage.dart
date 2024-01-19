import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool OTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  int OScore = 0;
  int XScore = 0;
  int Boxes = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Player O',
                            style: TextStyle( fontSize:50, color: Colors.blueGrey,),
                          ),
                          Text(
                            OScore.toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Player X',
                          style: TextStyle( fontSize:50, color: Colors.blueGrey,),
                        ),
                        Text(
                          XScore.toString(),
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tap(index);
                      },
                      child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: const TextStyle(
                             color: Colors.grey,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: (){clearBoard();
                          OScore =0;
                          XScore =0;},
                        child: Container(
                          child: const Text('Reset',style: TextStyle(color: Colors.grey, fontSize: 30),),
                          color: Colors.blueGrey[900],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: GestureDetector(
                        onTap: (){exit(0);},
                        child: Container(
                          color: Colors.blueGrey[900],
                          child:  const Text('Exit',style: TextStyle(color: Colors.grey, fontSize: 30),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tap(int index) {
    setState(() {
      if (OTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        Boxes += 1;
      } else if (!OTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        Boxes += 1;
      }
      OTurn = !OTurn;
      _CheckWinner();
    });
  }

  // ignore: non_constant_identifier_names
  void _CheckWinner() {
    // 1 row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      Win(displayXO[0]);
    }
    //2 row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      Win(displayXO[3]);
    }
    //3 row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      Win(displayXO[6]);
    }
    //1 column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      Win(displayXO[0]);
    }
    //2 column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      Win(displayXO[1]);
    }

    //3 column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      Win(displayXO[2]);
    }
    // right diagonal
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      Win(displayXO[2]);
    }
    // left diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      Win(displayXO[0]);
    } else if (Boxes == 9) {
      Draw();
    }
  }

  void Draw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey[900],
            elevation: 0,
            title: const Text("Draw", style: TextStyle(color: Colors.grey),),
            actions: [
              ElevatedButton(
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[800],
                ),
                child: const Text('Play Again!', style: TextStyle(color: Colors.grey),),
              ),
            ],
          );
        });
  }

  void Win(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey[900],
            elevation: 0,
            title: Text("Winner is $winner", style: const TextStyle(color: Colors.grey),),
            actions: [
              ElevatedButton(
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[800],
                ),
                child:   const Text('Play Again!', style: TextStyle(color: Colors.grey),),
              ),
            ],
          );
        });

    if (winner == 'O') {
      OScore = OScore + 1;
    } else if (winner == 'X') {
      XScore = XScore + 1;
    }
  }


  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    Boxes = 0;
  }
}
