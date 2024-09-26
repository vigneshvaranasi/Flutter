void main(){

  var person = Person("DevDuo", 19)
    ..name = 'vvsv'
    ..age = 19
    ..introduce();
}

class Person{
  String name;
  int age;

  Person(this.name,this.age);

  void introduce(){
    print("Hello there,I am $name , and I am $age years old");
  }

}