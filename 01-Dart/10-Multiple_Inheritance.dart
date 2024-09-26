void main(){

  var animal = Animal();

  animal.dogSound();
  animal.catSound();

}

class Animal with Dog,Cat {
}

mixin Dog{
  void dogSound(){
    print("Bow Bow....!🐕");
  }
}
mixin Cat{
  void catSound(){
    print("meow meow....!🐈");
  }
}
