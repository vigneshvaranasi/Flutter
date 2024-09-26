import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

// Main MyApp class should extend StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ApiIntegrationScreen(), // Display ApiIntegrationScreen
    );
  }
}

// ApiIntegrationScreen class remains as StatefulWidget
class ApiIntegrationScreen extends StatefulWidget {
  const ApiIntegrationScreen({super.key});

  @override
  _ApiIntegrationScreenState createState() => _ApiIntegrationScreenState();
}

class _ApiIntegrationScreenState extends State<ApiIntegrationScreen> {
  List<dynamic> products = []; // Store fetched products

  Future<void> fetchItems() async {
    const url = 'https://dummyjson.com/products';
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      print(data);
      setState(() {
        products = data['products']; // Update state with fetched products
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Integration'),
          backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: fetchItems, // Fetch data when button is pressed
            child: const Text("Fetch Data"),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Amazon",
            style: TextStyle(fontSize: 34),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                // print(products[index]);
                // return Text(products[index]['title']);
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      product['thumbnail'], 
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product['title']),
                    subtitle: Text('\$${product['price']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
