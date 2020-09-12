import 'package:flutter/material.dart';
import 'const.dart';

void main() => runApp(ShowWeather());

class ShowWeather extends StatefulWidget {
  @override
  _ShowWeather createState() => new _ShowWeather();
}

class _ShowWeather extends State<ShowWeather> {
  String userName = "淼";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double paddingRight = 30 / 1.0;
    double paddingLeft = 30 / 1.0;
    double width = size.width / 1.0;
    return SafeArea(
        child: Container(
      width: width - paddingRight - paddingLeft,
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
                            color: Color.fromARGB(64, 0, 0, 0), fontSize: 16)),
                    TextSpan(
                        text: "$userName",
                        style: TextStyle(
                            color: Color.fromARGB(64, 0, 0, 0), fontSize: 16))
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
    ));
  }
}
