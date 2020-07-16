import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double paddingRight = 30 / 1.0;
    double paddingLeft = 30 / 1.0;
    double width = size.width / 1.0;
    double height = size.height / 1.0;
    double paddingTop = 69.0;
    return Scaffold(
        body: SingleChildScrollView(
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
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "星期二",
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Color.fromARGB(217, 0, 0, 0)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "2020年7月13日",
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.1,
                            style:
                                TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/icon-sunny.png",
                        width: 40,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 37, bottom: 22),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          "assets/images/icon-avatar.png",
                          width: 40,
                        ),
                      ),
                      Column(
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "你好, ",
                                style: TextStyle(
                                    color: Color.fromARGB(64, 0, 0, 0),
                                    fontSize: 18)),
                            TextSpan(
                                text: "zm",
                                style: TextStyle(
                                    color: Color.fromARGB(64, 0, 0, 0),
                                    fontSize: 16))
                          ])),
                          Text(
                            "今天过得怎么样?",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            width: width - paddingRight - paddingLeft,
                            height: 50,
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {},
                              color: Color.fromARGB(256, 248, 248, 248),
                              highlightColor: Colors.grey,
                              colorBrightness: Brightness.dark,
                              splashColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Image.asset(
                                              "assets/images/icon-happy.png",
                                              width: 20,
                                            ),
                                          ),
                                          Text(
                                            "很不错",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    217, 0, 0, 0)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Container(
                            width: width - paddingRight - paddingLeft,
                            height: 50,
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {},
                              color: Color.fromARGB(256, 248, 248, 248),
                              highlightColor: Colors.grey,
                              colorBrightness: Brightness.dark,
                              splashColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Image.asset(
                                              "assets/images/icon-normal.png",
                                              width: 20,
                                            ),
                                          ),
                                          Text(
                                            "一般般",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    217, 0, 0, 0)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Container(
                            width: width - paddingRight - paddingLeft,
                            height: 50,
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {},
                              color: Color.fromARGB(256, 248, 248, 248),
                              highlightColor: Colors.grey,
                              colorBrightness: Brightness.dark,
                              splashColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Image.asset(
                                              "assets/images/icon-sad.png",
                                              width: 20,
                                            ),
                                          ),
                                          Text(
                                            "不太好",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    217, 0, 0, 0)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
