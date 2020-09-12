import 'package:flutter/material.dart';
import '../common/functions.dart';
import '../common/show_selected.dart';
import 'package:provider/provider.dart';
import '../common/show_record.dart';

void main() => runApp(CountWidget());

class CountWidget extends StatefulWidget {
  @override
  _CountWidget createState() => new _CountWidget();
}

class _CountWidget extends State<CountWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalForm>(builder: (context, obj, _) {
      if (obj.getDataContent() != "") {
        return new ShowRecord();
      } else {
        return new ShowSelected();
      }
    });
  }
}
