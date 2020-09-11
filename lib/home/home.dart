import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../common/const.dart';
import '../common/show_record.dart';
import '../common/show_selected.dart';
import '../common/functions.dart';
import 'package:provider/provider.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  double paddingRight = 30 / 1.0;
  double paddingLeft = 30 / 1.0;
  double paddingTop = 50.0;
  String userName = "淼";
  bool showNotifcation = false;

  String _getNowDayTime() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy年MM月dd日');
    return formatter.format(now);
  }

  //获取天气
  String getWetherFromApi() {
    return IconWeatherSunny;
  }

  String _getTodayWeek() {
    int w = DateTime.now().weekday;
    String str = "";
    switch (w) {
      case 1:
        str = "一";
        break;
      case 2:
        str = "二";
        break;
      case 3:
        str = "三";
        break;
      case 4:
        str = "四";
        break;
      case 5:
        str = "五";
        break;
      case 6:
        str = "六";
        break;
      case 7:
        str = "天";
        break;
    }
    return "星期$str";
  }

  Widget getShowDifferent() {
    GlobalForm form = new GlobalForm();
    if (form.getDataContent() != "") {
      return new ShowRecord();
    } else {
      return new ShowSelected();
    }
  }

  @override
  void initState() {
    getShowDifferent();
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
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    _getTodayWeek(),
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromARGB(217, 0, 0, 0)),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    _getNowDayTime(),
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                        color: Color.fromARGB(64, 0, 0, 0)),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                IconWeatherSunny,
                                width: 40,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 22),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  UserIcon,
                                  width: 50,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text: "你好, ",
                                            style: TextStyle(
                                                color:
                                                    Color.fromARGB(64, 0, 0, 0),
                                                fontSize: 16)),
                                        TextSpan(
                                            text: "$userName",
                                            style: TextStyle(
                                                color:
                                                    Color.fromARGB(64, 0, 0, 0),
                                                fontSize: 16))
                                      ]),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "今天过得怎么样?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountWidget(),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))));
  }
}

class CountWidget extends StatelessWidget {
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
