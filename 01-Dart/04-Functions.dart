void main(){
  print("Sum ${add(10, 20)}");
  greet();
  greet(name:"vvsv",age:19);
}

void greet({String name="Dev Duo",int age = 20}){
  print("Good Morning: ${name}!");
  print("Your Age is: ${age}");
}

int add(int a,int b){
  return a+b;
}

int sub(int a,int b){
  return a-b;
}