void main(){
  List<int> listDemo;
  listDemo = [];

  // Add elements
  listDemo.add(10);
  listDemo.add(20);
  listDemo.add(30);
  listDemo.add(40);

  // Print elements
  print(listDemo);

  // Remove elements
  listDemo.remove(20);

  listDemo.add(50);
  listDemo.add(50);
  listDemo.remove(50);
  print(listDemo);

  // print with for
  for(int num in listDemo){
    print(num);
  }






}