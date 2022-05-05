//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text("QR Code"),
        ),
        body: Center(
            child: Column(children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.brown),
            child: const Text("Scan QR Code"),
            onPressed: () {
              scanbarcode();
            },
          ),
          Text(code)
        ])));
  }
}

class Pilihan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: new AppBar(
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.qr_code_rounded,
                color: Colors.black,
              ),
              label: Text(
                "Show QR Code",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.black,
              ),
              label: Text(
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
