class UserDetails{
  String firstName="Bekzod";
  String lastName="Kuvondikov";
  int age=21;

  void printDetails(){}
  void sayhello(){
    print("Hello");
  }
}

class StudentDetails extends UserDetails{

  String ID="U1910212";
  String isMale(bool gender)=>gender?"male":"female";

  @override
  void printDetails() {
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Age: $age');
    print('Gender: ${isMale(true)}');
    print('ID Number: $ID');
    super.printDetails();
  }
}

main(){
  StudentDetails student=new StudentDetails();
  student.sayhello();
  student.printDetails();
}