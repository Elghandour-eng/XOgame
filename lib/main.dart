import 'package:flutter/material.dart';

void main() {
  runApp(XOgame());
}

class XOgame extends StatefulWidget {
  @override
  _XOgameState createState() => _XOgameState();
}

class _XOgameState extends State<XOgame> {
List <String> displayxo =['','','','','','','','',''];
bool turn=true;
String winner;
int xscore =0;
int oscore =0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Palyer X',style: TextStyle(color: Colors.white,fontSize: 27) ,
                    ),
                    SizedBox(height: 10,),
                    Text(xscore.toString(),style: TextStyle(color: Colors.white,fontSize: 27))
                  ],
                ),

                Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Palyer O',style: TextStyle(color: Colors.white,fontSize: 27) ,
                    ),
                    SizedBox(height: 10,),
                    Text(oscore.toString(),style: TextStyle(color: Colors.white,fontSize: 27))
                  ],
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,

              ),itemCount: 9, itemBuilder: (context ,index)
              {
                return GestureDetector(
                  onTap: (){
                    display(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[700])
                    ),
                    child: Center(
                      child: Text(
                        displayxo[index],style: TextStyle(color: Colors.white,fontSize: 30),
                      ),
                    ),
                  ),
                );
              }
              ),
            ),
          SizedBox(height: 5,),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                height: 50,
                width: 300

                ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),child:
                    GestureDetector(
                        onTap: playagain,
                        child: Center(child: Text('Play Again',style: TextStyle(color: Colors.white,fontSize: 30),))),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 300

                    ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red[900]),child:
                  GestureDetector(
                      onTap: endgame,
                      child: Center(child: Text('End Game',style: TextStyle(color: Colors.white,fontSize: 30),))),)
                ],
              ),
            )
          
          ],
        ),
      ),
    );
  }
 void display(int index){
    setState(() {
      if(turn  && displayxo[index]== ''){
        displayxo[index]='x';

      }else if (!turn && displayxo[index]=='')
        {
            displayxo[index]='o';
        }
      turn =  !turn;
      checkwinner();
      score();

    });
  }
  checkwinner(){
   if(displayxo[0]==displayxo[1]&&displayxo[0]==displayxo[2]&&displayxo[0] != '')
   {
     print('${displayxo[0]} is winner ');
     winner=displayxo[0];
   }

   if(displayxo[3]==displayxo[4]&&displayxo[3]==displayxo[5]&&displayxo[3] != '')
   {
     print('${displayxo[3]} is winner ');
     winner=displayxo[3];
   }

   if(displayxo[6]==displayxo[7]&&displayxo[6]==displayxo[8]&&displayxo[6] != '')
   {
     print('${displayxo[6]} is winner ');
     winner=displayxo[6];
   }

   if(displayxo[0]==displayxo[3]&&displayxo[0]==displayxo[6]&&displayxo[0] != '')
   {
     print('${displayxo[0]} is winner ');
     winner=displayxo[0];
   }

   if(displayxo[1]==displayxo[4]&&displayxo[1]==displayxo[7]&&displayxo[1] != '')
   {
     print('${displayxo[1]} is winner ');

   winner=displayxo[1];
   }
   if(displayxo[2]==displayxo[5]&&displayxo[2]==displayxo[8]&&displayxo[2] != '')
   {
     print('${displayxo[8]} is winner ');
   winner=displayxo[8];
   }

   if(displayxo[0]==displayxo[4]&&displayxo[0]==displayxo[8]&&displayxo[0] != '')
   {
     print('${displayxo[0]} is winner ');
     winner=displayxo[0];
   }
   if(displayxo[2]==displayxo[4]&&displayxo[2]==displayxo[6]&&displayxo[2] != '')
   {
     print('${displayxo[2]} is winner ');
     winner=displayxo[2];


   }
   else{
     print('Draw');
   }
  }
  void score()
  {
    if(winner == 'o')
    {
      setState(() {
        oscore++;
      });
    }
    else if(winner=='x'){
      setState(() {
        xscore++;
      });
    }
  }
  void playagain(){
    for(int i =0;i<9;i++)
    {
      setState(() {
        winner ='';
        displayxo[i]='';
      });
    }
  }

  void endgame() {
    for(int i =0;i<9;i++)
    {
      setState(() {
        winner ='';
        displayxo[i]='';
        xscore =0;
        oscore=0;
      });
    }
  }
}
