import 'package:flutter/material.dart';
import 'const.dart';
import 'functions.dart';

void main() => runApp(ShowRecord());

class ShowRecord extends StatefulWidget {
  @override
  _ShowRecord createState() => new _ShowRecord();
}

class _ShowRecord extends State<ShowRecord> {
  GlobalForm form;

  @override
  void initState() {
    form = new GlobalForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Text(
          form.getDataContent(),
          style: TextStyle(fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Image.asset(
            IconMoodEedit,
            width: 26,
          ),
        )
      ],
    ));
  }
}
