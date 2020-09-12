import 'package:flutter/material.dart';
import '../const/const.dart';
import 'overlay_entry.dart';

void main() => runApp(ShowWeather());

class ShowWeather extends StatefulWidget {
  @override
  _ShowWeather createState() => new _ShowWeather();
}

class _ShowWeather extends State<ShowWeather> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double paddingRight = 30 / 1.0;
    double paddingLeft = 30 / 1.0;
    double width = size.width / 1.0;
    return SafeArea(
        child: Container(
            width: width - paddingRight - paddingLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        getTodayWeek(),
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Color.fromARGB(217, 0, 0, 0)),
                      ),
                    ),
                    Container(
                      child: Text(
                        getNowDayTime(),
                        textAlign: TextAlign.left,
                        textScaleFactor: 1.1,
                        style: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
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
            )));
  }
}
