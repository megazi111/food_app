import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/screens/addAddress.dart';
import 'package:foodapp/screens/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
