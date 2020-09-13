import 'package:flutter/material.dart';
import '../model/mood_form.dart';
import 'package:provider/provider.dart';
import '../components/show_record.dart';
import '../components/show_unrecord.dart';

void main() => runApp(ChooseShowSelectedOrRecord());

class ChooseShowSelectedOrRecord extends StatefulWidget {
  @override
  _ChooseShowSelectedOrRecord createState() => _ChooseShowSelectedOrRecord();
}

class _ChooseShowSelectedOrRecord extends State<ChooseShowSelectedOrRecord> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalForm>(builder: (context, obj, _) {
      if (obj.getTodayIsSetMood()) {
        return Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: new ShowRecord(),
        );
      } else {
        return new ShowUnrecord();
      }
    });
  }
}
