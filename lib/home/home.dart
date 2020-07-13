import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 69, right: 31.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text("星期二"),
                        ),
                        Container(
                          child: Text("2020年7月13日"),
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
                Row(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/icon-avatar.png",
                        width: 40,
                      ),
                    ),
                    Column(
                      children: [Text("你好，zm"), Text("今天过得怎么样")],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        FlatButton(
                          onPressed: () {},
                          color: Colors.blue,
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icon-happy.png",
                                width: 20,
                              ),
                              Text("很不错")
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        FlatButton(
                          onPressed: () {},
                          color: Colors.blue,
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icon-normal.png",
                                width: 20,
                              ),
                              Text("很一般")
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        FlatButton(
                          onPressed: () {},
                          color: Colors.blue,
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icon-sad.png",
                                width: 20,
                              ),
                              Text("不太好")
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        )
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
