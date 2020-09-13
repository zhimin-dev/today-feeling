import 'package:flutter/material.dart';
import '../model/mood_form.dart';
import 'package:provider/provider.dart';
import '../components/show_record.dart';
import '../components/show_unrecord.dart';

void main() => runApp(CountWidget());

class CountWidget extends StatefulWidget {
  @override
  _CountWidget createState() => new _CountWidget();
}

class _CountWidget extends State<CountWidget> {
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
