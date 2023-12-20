import 'dart:io';

List<String> Val=['1','2','3','4','5','6','7','8','9'];
List<String> winProb =['012','048','036','147','246','258','345','678'];
bool win=false;
bool turn=true;
int count=0;

void main (){
viewXO();
PrintXO();
}


bool check_prob(String comb,String check){

  List CheckWinNum=comb.split('').map((e) {
    return int.parse(e);
  }).toList();

  bool match=false;

  for (final e in CheckWinNum){
    if(Val[e]==check){
      match=true;
    }
    else {
      match=false;
      break;
    }
  }
return match;
}


void CheckWinner (player) {
  for (final e in winProb){
    bool combValid=check_prob(e, player);
    if (combValid==true){
      print(" $player WON....");
      win=true;
      break;
    }
  }
}



void PrintXO(){
if(turn==true){
  print("Player 1, Please enter the number of the square where you want to place your X ");}
else   print("Player 2, Please enter the number of the square where you want to place your O ");

int xo=int.parse(stdin.readLineSync()!);
if(Val[xo-1]=='X' || Val[xo-1]=='O'){
  print("Error :  this Square reserved");
  turn=!turn;
}
else {
  Val[xo - 1] = turn ? 'X' : 'O';}
  turn = !turn;
  count++;
  if (count == 9) {
    win = true;
    print("..Draw..");
  }

 else{
viewXO();
  }

 CheckWinner('X');
 CheckWinner('O');

if(win==false) PrintXO();

}

void viewXO (){


  print(' ${Val[0]} | ${Val[1]} | ${Val[2]}  ');
  print('---+---+---' );
  print(' ${Val[3]} | ${Val[4]} | ${Val[5]}  ');
  print('---+---+---' );
  print(' ${Val[6]} | ${Val[7]} | ${Val[8]}  ');


}