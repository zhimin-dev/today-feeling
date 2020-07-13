import 'package:flutter/material.dart';

void main() => runApp(Footer());

class Footer extends StatefulWidget {
  @override
  _Footer createState() => new _Footer();
}

class _Footer extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("page 2"),
    );
  }
}
