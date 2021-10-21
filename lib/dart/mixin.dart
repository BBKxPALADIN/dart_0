enum Name {Bekzod,Shaxzod,Jamshid}

abstract class Player{
  void player();
}

mixin PlayerName{
  Name _name=Name.Jamshid;
  void setName(Name name)=>{_name=name};
  Name get name=>_name;
}


class DisplayName extends Player with PlayerName{
  @override
  void player() {
    print('Player Name is: $_name');
  }
}

void main(){
  DisplayName()
    ..setName(Name.Bekzod)
    ..player();
}