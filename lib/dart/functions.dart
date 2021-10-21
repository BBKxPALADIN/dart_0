void main(){

  int a=5;
  int b=10;
  int result=multiplication(a, b);

  sayHelloWorld();
  print(printName('Bekzod'));
  print('Multiplication: $a * $b = $result');
}

void sayHelloWorld(){
  print('Hello World!!!');
}

String printName(String name){
  return('My name is $name');
}

int multiplication(int a,int b)=>a*b;