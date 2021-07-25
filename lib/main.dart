import 'package:flutter/material.dart';

void main() {
  runApp(XOGame());
}

class XOGame extends StatefulWidget {
  @override
  _XOGameState createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  int xScore = 0;
  int oScore = 0;
  bool turn =false;
  String winner='';
  List<String> input = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Player X',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          xScore.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Player O',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          oScore.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 75,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: input.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                     onUserTap(index);
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                         
                         child: Center(
                           child: Text(input[index],style: TextStyle(
                             color: Colors.white,fontSize: 30
                           ),),
                         ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            playAgain();
                          },
                          child: Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                'Play Again',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            endGame();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            height: 60,
                            width: 300,
                            child: Center(
                              child: Text(
                                'End Game',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
  void onUserTap( int i)
  {
    if(turn && input[i]=='')
    {
      setState(() {
        input[i] ='X';
        turn =!turn;
        print(input);
      });
    }
    else if(!turn&& input[i]=='')
    {
      setState(() {
        input[i] ='O';
        turn =!turn;
        print(input);
      });
    }
    checkWinner();
    score();
  }
  void playAgain()
  {
    for(int i=0;i<9;i++)
      {
setState(() {
  input[i]='';
  print(input);
});
      }
  }
  void endGame()
  {
    for(int i=0;i<9;i++)
    {
      setState(() {
        input[i]='';
        print(input);
      });
    }
    setState(() {
      xScore=0;
      oScore=0;
    });
  }
  void checkWinner()
  {
    if(input[0]==input[1]&& input[0]==input[2]&&input[0]!='')
    {
      winner=input[0];
    }
    else if(input[3]==input[4]&&input[3]==input[5]&&input[3]!='')
    {
      winner=input[3];
    }
    else
      {
        print('No Winner');
      }
  }
score()
{
  if(winner=='X')
    {
      setState(() {
        xScore++;
        winner='';
      });
      playAgain();
    }
  else if(winner=='O')
    {
      setState(() {
        oScore++;
        winner='';
      });
      playAgain();
    }
}
}
