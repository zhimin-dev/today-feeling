import 'package:flutter/material.dart';
import '../components/show_weather.dart';
import '../components/show_what_is_up.dart';
import '../model/mood_form.dart';
import '../components/show_record.dart';
import '../components/show_selected.dart';
import '../components/overlay_entry.dart';
import '../const/const.dart';
import 'package:provider/provider.dart';
import '../components/choose_show_selected_or_recored.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  double paddingRight = 30 / 1.0;
  double paddingLeft = 30 / 1.0;
  double paddingTop = 50.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => new GlobalForm()),
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
                    ShowWeather(),
                    ChooseShowSelectedOrRecord(),
                  ],
                ),
              ),
            ))));
  }
}
