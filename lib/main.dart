// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:http/http.dart' as http;
// import 'package:uaspemrogmobile/modelData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //static const customSwatch = Color.fromARGB(255, 68, 146, 116);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner Barcode',
      theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<LoginPage> {
  String email = "admin";
  String password = "12345";

  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      //height: 915,
      color: Colors.teal[800],
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: <Widget>[
        const Padding(padding: EdgeInsets.all(10)),
        const Text("Absensi", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.only(bottom: 100)),
        _formBuilder(),
      ]),
    )));
  }

  Widget _formBuilder() {
    return Form(
      key: formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailControl,
              keyboardType: TextInputType.emailAddress,
              cursorColor: const Color.fromARGB(31, 255, 255, 255),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Username tidak boleh kosong';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "username or email",
                hintStyle: const TextStyle(color: Colors.white),
                labelText: "Username",
                labelStyle: const TextStyle(color: Color.fromARGB(95, 255, 255, 255)),
                prefixIcon: const Icon(Icons.account_circle, color: Color.fromARGB(255, 255, 255, 255)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: passwordControl,
                obscureText: true,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Color.fromARGB(96, 255, 255, 255)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 45,
              width: 600,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const Pilihan();
                      }));
                    } else {
                      // ignore: avoid_print
                      print('Password salah');
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class Pilihan extends StatefulWidget {
  const Pilihan({Key? key}) : super(key: key);
  @override
  _MyPilihan createState() => _MyPilihan();
}

class _MyPilihan extends State<Pilihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Scanner();
                }));
              },
              icon: const Icon(
                Icons.qr_code_scanner,
                color: Colors.black,
              ),
              label: const Text(
                "Scane QR Code",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);
  @override
  _MyScanner createState() => _MyScanner();
}

class _MyScanner extends State<Scanner> {
  String code = "";
  String getcode = "";
  Future scanbarcode() async {
    getcode = await FlutterBarcodeScanner.scanBarcode("#009922", "Cancel", true, ScanMode.DEFAULT);
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Konfirmasi();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[800],
        appBar: AppBar(
          title: const Text("QR Code"),
        ),
        body: Center(
            child: Column(children: <Widget>[
          const Padding(padding: EdgeInsets.all(250)),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.black),
            child: const Text("Scan QR Code"),
            onPressed: () {
              scanbarcode();
            },
          ),
        ])));
  }
}

class Konfirmasi extends StatelessWidget {
  const Konfirmasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Center(
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.white,
          child: SizedBox(
            width: 250,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: const Icon(
                        Icons.check_circle_rounded, // ReplaceMe
                        size: 80.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ), //SizedBox //Text,
                  const Text(
                    "Sudah Hadir",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ), //Textstyle
                  ), //Text
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "1 Mei 2022",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ), //Textstyle
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "07.30",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ), //Textstyle
                  ), //SizedBox //SizedBox
                ],
              ), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ),
    );
  }
}
