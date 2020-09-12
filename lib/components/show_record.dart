import 'package:flutter/material.dart';
import '../const/const.dart';
import 'overlay_entry.dart';
import '../model/mood_form.dart';

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

  void showTextarea() {
    GlobalForm form = new GlobalForm();
    form.setMoodType(form.getDataMoodType());
    form.setContext(context);
    form.setContent(form.getDataContent());
    form.setShowContent();
    form.setEntry(formOverlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            form.getShowContent(),
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: GestureDetector(
            onTap: () {
              showTextarea();
            },
            child: Image.asset(
              IconMoodEedit,
              width: 26,
            ),
          ),
        )
      ],
    ));
  }
}