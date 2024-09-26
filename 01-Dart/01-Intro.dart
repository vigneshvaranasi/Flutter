void main(){
  print("Hello World");
  
  var name = "Dev Duo";
  print(name);

  print("Name: "+name);
  print("Name: $name");

  // Data types in Dart -> int,double,String,bool
  int age = 20;
  double height = 5.8;
  String country = "India";
  bool isStudent = true;

  print("Name :$name,Age:${age+20}");


  // Operations
  var a = 10;
  var b = 20;
  print(a+b);
  print(a-b);
  print(a*b);
  print(a/b);
  print(a%b);


  // Control Flow Statements -> if,else,else if,switch
  var x = 10;
  if(x==10)
    print("X is 10");
  else
    print("X is not 10");

  if(x==10){
    print("x is 10");
  }
  else if(x<10){
    print("x is < 10");
  }
  else{
    print("x is > 10");
  }


  var grade = "A";
  switch(grade){
    case 1:
  }
}