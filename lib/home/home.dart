import 'package:flutter/material.dart';
import '../common/show_what_is_up.dart';
import '../common/const.dart';
import '../common/show_weather.dart';
import '../common/show_record.dart';
import '../common/show_selected.dart';
import '../common/functions.dart';
import 'package:provider/provider.dart';
import '../common/choose_show_selected_or_recored.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  double paddingRight = 30 / 1.0;
  double paddingLeft = 30 / 1.0;
  double paddingTop = 50.0;
  bool showNotifcation = false;

  // Widget getShowDifferent() {
  //   GlobalForm form = new GlobalForm();
  //   if (form.getDataContent() != "") {
  //     return new ShowRecord();
  //   } else {
  //     return new ShowSelected();
  //   }
  // }

  @override
  void initState() {
    // getShowDifferent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GlobalForm()),
        ],
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            body: Container(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: paddingLeft, top: paddingTop, right: paddingRight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowWhatIsUp(),
                    ShowWeather(),
                    CountWidget(),
                  ],
                ),
              ),
            ))));
  }
}
