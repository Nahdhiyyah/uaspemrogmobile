import 'package:flutter/material.dart';
import 'scanpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR Code",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}
