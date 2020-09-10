import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    double paddingTop = 50.0;
    bool showNotifcation = false;
    String userName = "淼";
    bool showForm = false;
    bool showFinish = false;
    bool showSaving = false;
    OverlayEntry formOverlayEntry;
    OverlayEntry finishOverlayEntry;
    OverlayEntry loadingOverlayEntry;
    FocusNode _focusNode = new FocusNode();
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    Future<Null> _focusNodeListener() async {
      // 用async的方式实现这个listener
      if (_focusNode.hasFocus) {
        print('TextField got the focus');
      } else {
        print('TextField lost the focus');
      }
    }

    @override
    void dispose() {
      _focusNode.removeListener(_focusNodeListener); // 页面消失时必须取消这个listener！！
      super.dispose();
    }

    String _getNowDayTime() {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy年MM月dd日');
      return formatter.format(now);
    }

    final textFiledController = TextEditingController();
    textFiledController.addListener(() {
      print('input ${textFiledController.text}');
    });

    String _getTodayWeater() {
      return "assets/images/icon-sunny.png";
    }

    String _getFinishIcon() {
      return "assets/images/img-succeed.png";
    }

    //取消按钮
    void hideTextarea() {
      if (showForm) {
        formOverlayEntry.remove();
        showForm = false;
      }
    }

    void test() {
      showFinish = true;
      Overlay.of(context).insert(finishOverlayEntry);
    }

    //保存表单数据
    void savingForm() {
      Future.delayed(Duration(seconds: 1), () {
        if (showSaving) {
          loadingOverlayEntry.remove();
          showSaving = false;
        }
        Overlay.of(context).insert(finishOverlayEntry);
        showFinish = true;
      });
    }

    //保存按钮
    void submitTextarea() {
      if (showForm) {
        formOverlayEntry.remove();
        showForm = false;
        showSaving = true;
        Overlay.of(context).insert(loadingOverlayEntry);
        savingForm();
      }
    }

    void hideFinishForm() {
      if (showFinish) {
        finishOverlayEntry.remove();
        showFinish = false;
      }
    }

    loadingOverlayEntry = new OverlayEntry(builder: (context) {
      return new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(children: [
            Positioned(
              child: Material(
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
              width: width,
              height: height,
            ),
            Center(
                child: Text(
              "保存中...",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
          ]));
    });

    formOverlayEntry = new OverlayEntry(builder: (context) {
      return new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Positioned(
                child: Material(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                ),
                width: width,
                height: height,
              ),
              Positioned(
                  bottom: MediaQuery.of(context).viewInsets.bottom > 0
                      ? MediaQuery.of(context).viewInsets.bottom -
                          MediaQuery.of(context).padding.bottom
                      : 0,
                  width: width,
                  height: 0.4 * height,
                  child: new Material(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddingLeft, right: paddingRight),
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Text("取消"),
                                    onTap: () => {hideTextarea()},
                                  ),
                                  Image.asset(
                                    _getTodayWeater(),
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "保存",
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                    onTap: () => {submitTextarea()},
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxHeight: height - 100),
                              child: TextField(
                                focusNode: _focusNode,
                                controller: textFiledController,
                                maxLines: 12,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    )),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ));
    });

    //弹出心情form表单
    void showTextarea() {
      showForm = true;
      Overlay.of(context).insert(formOverlayEntry);
    }

    finishOverlayEntry = new OverlayEntry(builder: (context) {
      return new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(children: [
            Positioned(
              child: Material(
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
              width: width,
              height: height,
            ),
            Positioned(
              bottom: 0,
              width: width,
              height: 0.5 * height,
              child: new Material(
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: paddingLeft, right: paddingRight),
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 10),
                          child: Image.asset(
                            _getFinishIcon(),
                            width: 120,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            width: width - paddingRight - paddingLeft,
                            height: 50,
                            margin: EdgeInsets.only(top: 30),
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {
                                hideFinishForm();
                              },
                              color: Color.fromARGB(100, 200, 200, 200),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "太赞了！",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(217, 0, 0, 0)),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]));
    });

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

    return Scaffold(
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
                            _getTodayWeater(),
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
                              "assets/images/icon-avatar.png",
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
                                            color: Color.fromARGB(64, 0, 0, 0),
                                            fontSize: 18)),
                                    TextSpan(
                                        text: "$userName",
                                        style: TextStyle(
                                            color: Color.fromARGB(64, 0, 0, 0),
                                            fontSize: 18))
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
                        Column(
                          children: [
                            Container(
                                width: width - paddingRight - paddingLeft,
                                height: 50,
                                margin: EdgeInsets.only(top: 30),
                                alignment: Alignment.center,
                                child: FlatButton(
                                  onPressed: () {
                                    test();
                                  },
                                  color: Color.fromARGB(100, 200, 200, 200),
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
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
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Image.asset(
                                                  "assets/images/icon-happy.png",
                                                  width: 30,
                                                ),
                                              ),
                                              Text(
                                                "很不错",
                                                style: TextStyle(
                                                    fontSize: 16,
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
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: FlatButton(
                                  onPressed: () {
                                    showTextarea();
                                  },
                                  color: Color.fromARGB(100, 200, 200, 200),
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
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
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Image.asset(
                                                  "assets/images/icon-normal.png",
                                                  width: 25,
                                                ),
                                              ),
                                              Text(
                                                "一般般",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        180, 0, 0, 0)),
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
                                margin: EdgeInsets.only(top: 20),
                                height: 50,
                                alignment: Alignment.center,
                                child: FlatButton(
                                  onPressed: () {},
                                  color: Color.fromARGB(100, 200, 200, 200),
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
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
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Image.asset(
                                                  "assets/images/icon-sad.png",
                                                  width: 20,
                                                ),
                                              ),
                                              Text(
                                                "不太好",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        140, 0, 0, 0)),
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
        )));
  }
}
