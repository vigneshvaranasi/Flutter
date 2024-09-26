import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => MyApp();
}

GlobalKey<NavigatorState> navigotorKey = GlobalKey<NavigatorState>();

class MyApp extends State<RunMyApp> {
  bool isPasswordVisable = false;

  @override
  void initState() {
    super.initState();
    isPasswordVisable = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Simple Flutter App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          // title: const Text('Welcome to XYZ',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 25,
          //         fontWeight: FontWeight.bold)),
          // centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            const Text('Welcome to XYZ',
                style: TextStyle(
                    color: Color(0xFFE6E6E6),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email Id',
                      style: TextStyle(
                        color: Color(0xFFE6E6E6),
                        fontSize: 20,
                      )),
                  TextField(
                      decoration: InputDecoration(
                        // labelText: "Email ID",
                        hintText: "Enter Email ID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: const Color(0xFFE6E6E6),
                        filled: true,
                      ),
                      onChanged: (email) {
                        print("Email Changed to $email");
                      }),
                  const SizedBox(height: 10),
                  const Text('Password',
                      style: TextStyle(
                        color: Color(0xFFE6E6E6),
                        fontSize: 20,
                      )),
                  TextField(
                      obscureText: isPasswordVisable,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisable
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordVisable = !isPasswordVisable;
                            });
                          },
                        ),
                        // labelText: "Email ID",
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: const Color(0xFFE6E6E6),
                        filled: true,
                      ),
                      onChanged: (password) {
                        print("Password Changed to $password");
                      }),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          print("Button Pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(7, 127, 249,1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // primary: Colors.blue,
                        ),
                        child: const Text("Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ))),
                  )
                ],
              ),
            )
            // TextField(
            //   decoration: InputDecoration(
            //     // border: OutlineInputBorder(),
            //     labelText: 'Email Id',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
