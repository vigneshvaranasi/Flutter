void main(){
  try{
    int result = 12 ~/ 0;
    print("Result: $result");
  }
  catch(e){
    print("Caught error:$e");
  }
}