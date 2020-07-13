import 'package:flutter/material.dart';

void main() => runApp(Calendar());

class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => new _Calendar();
}

class _Calendar extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("page 2"),
    );
  }
}
