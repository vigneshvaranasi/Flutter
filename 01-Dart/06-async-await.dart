void main() async{
  print("Fetching Data");
  String data = await fetchData();
  print(data);
}

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 5));
    return "Hello World";
}