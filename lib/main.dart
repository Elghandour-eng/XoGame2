import 'package:flutter/material.dart';

void main() {
  runApp(XOGame());
}

class XOGame extends StatefulWidget {
  @override
  _XOGameState createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  List input = ['', '', '', '', '', '', '', '', ''];
  bool turn = false;
  int oScore=0;
  int xScore =0;
String winner ='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[800],
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Player x',style: TextStyle(fontSize: 25,color: Colors.white),),

                        Text(xScore.toString(),style: TextStyle(fontSize: 25,color: Colors.white),),

                      ],
                    ),
                    Column(
                      children: [
                        Text('Player O',style: TextStyle(fontSize: 25,color: Colors.white),),
                        Text(oScore.toString(),style: TextStyle(fontSize: 25,color: Colors.white),),

                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          onUserTap(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[600]),
                          ),
                          child: Center(
                              child: Text(
                         input[index],
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
  void onUserTap(int i)
  {
    if(turn ==true && input[i] =='')
    {
      setState(() {
        input[i ]='X';
      });
    }
    else if(turn ==false&& input [i]=='')
    {
      setState(() {
        input[i ]='O';
      });
    }
    turn =!turn;
    checkWinner();
    score();


  }
  void checkWinner()
  {
//Row 1st
  if(input[0]==input[1]&&input[0]==input[2]&&input[0]!= ''  )
  {
    winner =input[0];
  }
  //Row 2nd
    else if(input[3]==input[4]&&input[3]==input[5]&&input[3]!='')
    {
      winner =input[3];

    }
    //Row 3rd
  else if(input[6]==input[7]&&input[6]==input[8]&&input[8]!='')
  {
    winner =input[6];

  }
  //column 1st
  else if(input[0]==input[3]&&input[0]==input[6]&&input[0]!='')
  {
    winner =input[0];

  }
  else
    {
      print('No Winner Yet');
    }
  }
  void score()
  {
    if(winner=='X')
    {
      setState(() {
        xScore++;
        for(int i =0; i<input.length;i++)
        {
          input[i]='';
        }
      });
      winner='';

    }
    else if(winner =='O')
      {
        setState(() {
          oScore++;

          for(int i =0; i<input.length;i++)
          {
            input[i]='';
          }
        });
        winner='';
      }
  }
}
