import 'package:flutter/material.dart';
import '../const/const.dart';
import '../model/app_base.dart';
import '../components/show_what_is_up.dart';
import '../components/show_selected.dart';

void main() => runApp(ShowUnrecord());

class ShowUnrecord extends StatefulWidget {
  @override
  _ShowUnrecord createState() => new _ShowUnrecord();
}

class _ShowUnrecord extends State<ShowUnrecord> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ShowWhatIsUp(), ShowSelected()],
    );
  }
}
