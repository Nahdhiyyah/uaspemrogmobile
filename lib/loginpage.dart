import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  String email = "nadia@gmail.com";
  String password = "nadia";

  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  final formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: 375,
      height: 667,
      color: Color.fromARGB(255, 68, 146, 116),
      padding: EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(padding: EdgeInsets.all(10)),
        Text("Absensi", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
        Padding(padding: EdgeInsets.all(15)),
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
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: emailControl,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Color.fromARGB(31, 255, 255, 255),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Username tidak boleh kosong';
                }
                return null;
              },
              decoration: new InputDecoration(
                hintText: "username or email",
                hintStyle: TextStyle(color: Colors.white),
                labelText: "Username",
                labelStyle: TextStyle(color: Color.fromARGB(95, 255, 255, 255)),
                prefixIcon: Icon(Icons.account_circle, color: Color.fromARGB(255, 255, 255, 255)),
                enabledBorder: OutlineInputBorder(borderRadius: new BorderRadius.circular(25), borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2)),
                focusedBorder: OutlineInputBorder(borderRadius: new BorderRadius.circular(25), borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: passwordControl,
                obscureText: true,
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                  hintText: "password",
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Color.fromARGB(96, 255, 255, 255)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius: new BorderRadius.circular(25), borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2)),
                  focusedBorder: OutlineInputBorder(borderRadius: new BorderRadius.circular(25), borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 45,
              width: 300,
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
                        return LoginPage();
                      }));
                    } else {
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
