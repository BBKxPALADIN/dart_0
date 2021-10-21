typedef Operation<Int> = int Function(int num1, int num2);

int operaionWithInt(Operation<int> operation, int num1, int num2) {
  return operation(num1, num2);
}

class Multiplication {
  void multipl() {}
}

class Division {
  void div() {}
}

class Counting implements Multiplication, Division {
  int num1, num2;

  Counting(this.num1, this.num2);

  Operation<int> multiplication = (num1, num2) => num1 * num2;
  Operation<int> division = (num1, num2) => num1 ~/ num2;

  @override
  void div() {
    print(multiplication);
    print(operaionWithInt(multiplication, num1, num2));
  }

  @override
  void multipl() {
    print(division);
    print(operaionWithInt(division, num1, num2));
  }
}

void main(){
  Counting count=new Counting(10, 12);
  count.multipl();
  count.div();
}