import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: Scaffold(
        body: Center(
          child: Text('Hello Github',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900
          ),),
        ),
      )
    );
  }
}
