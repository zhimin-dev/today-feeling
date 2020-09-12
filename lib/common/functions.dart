import 'package:flutter/material.dart';
import 'const.dart';
import 'package:intl/intl.dart';

var loadingOverlayEntry = new OverlayEntry(builder: (context) {
  final size = MediaQuery.of(context).size;
  double paddingRight = 30 / 1.0;
  double paddingLeft = 30 / 1.0;
  double bottomPadding = MediaQuery.of(context).padding.bottom;
  GlobalForm form = new GlobalForm();
  form.setContext(context);
  return new ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: [
          Positioned(
            child: Material(
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
            width: size.width,
            height: size.height,
          ),
          Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom > 0
                  ? MediaQuery.of(context).viewInsets.bottom - bottomPadding
                  : 0,
              width: size.width,
              height: 0.4 * size.height,
              child: new Material(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: paddingLeft, right: paddingRight),
                  child: new Container(
                    child: Center(
                      child: Text(InputMoodFormSavingText,
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
              )),
        ],
      ));
});

var finishOverlayEntry = new OverlayEntry(builder: (context) {
  final size = MediaQuery.of(context).size;
  double paddingRight = 30 / 1.0;
  double paddingLeft = 30 / 1.0;
  GlobalForm form = new GlobalForm();
  form.setContext(context);
  return new ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(children: [
        Positioned(
          child: Material(
            color: Color.fromRGBO(0, 0, 0, 0.4),
          ),
          width: size.width,
          height: size.height,
        ),
        Positioned(
          bottom: 0,
          width: size.width,
          height: 0.4 * size.height,
          child: new Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Padding(
              padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
              child: new Container(
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 10),
                      child: Image.asset(
                        IconPostSuccess,
                        width: 120,
                      ),
                    ),
                    Center(
                      child: Text(InputMoodFormHasRecordedTip,
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: size.width - paddingRight - paddingLeft,
                        height: 50,
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: () {
                            GlobalForm form = new GlobalForm();
                            form.closeEntry();
                          },
                          color: Color.fromRGBO(255, 236, 228, 1),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                IconPostSuccessText,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(255, 125, 66, 1)),
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

var formOverlayEntry = new OverlayEntry(builder: (context) {
  final size = MediaQuery.of(context).size;
  double paddingRight = 30 / 1.0;
  double paddingLeft = 30 / 1.0;
  double bottomPadding = MediaQuery.of(context).padding.bottom;
  String showFormMoodIcon = IconMoodHappy;
  GlobalForm form = new GlobalForm();
  showFormMoodIcon = form.getMoodIcon();
  form.setContext(context);
  final textFiledController = TextEditingController();
  FocusNode _focusNode = new FocusNode();

  return new ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: [
          Positioned(
            child: Material(
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
            width: size.width,
            height: size.height,
          ),
          Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom > 0
                  ? MediaQuery.of(context).viewInsets.bottom - bottomPadding
                  : 0,
              width: size.width,
              height: 0.4 * size.height,
              child: new Material(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: paddingLeft, right: paddingRight),
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Text(InputMoodFormCancelText),
                                onTap: () {
                                  GlobalForm form = new GlobalForm();
                                  form.setData(MoodTypeHappy, "");
                                  form.closeEntry();
                                },
                              ),
                              Image.asset(
                                showFormMoodIcon,
                                width: 30,
                              ),
                              GestureDetector(
                                child: Text(
                                  InputMoodFormCancelSave,
                                  style: TextStyle(color: Colors.orange),
                                ),
                                onTap: () {
                                  GlobalForm form = new GlobalForm();
                                  form.setData(1, "21212");
                                  form.closeEntry();
                                  form.setEntry(loadingOverlayEntry);
                                  Future.delayed(Duration(seconds: 1), () {
                                    form.closeEntry();
                                    form.setEntry(finishOverlayEntry);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: size.height - 100),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: textFiledController,
                            maxLines: 10,
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

String getNowDayTime() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy年MM月dd日');
  return formatter.format(now);
}

//获取天气
String getWetherFromApi() {
  return IconWeatherSunny;
}

String getTodayWeek() {
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

class GlobalForm extends ChangeNotifier {
  factory GlobalForm() => _getInstance();
  static GlobalForm _instance;
  GlobalForm._();
  static GlobalForm _getInstance() {
    if (_instance == null) {
      _instance = GlobalForm._();
    }
    return _instance;
  }

  int moodType;
  String content = "";
  String moodIcon;
  OverlayEntry enrty;

  BuildContext outsideContext;

  void setEntry(OverlayEntry entry) {
    if (entry != null) {
      this.enrty = entry;
      Overlay.of(this.outsideContext).insert(entry);
    }
  }

  void setContext(BuildContext ctx) {
    this.outsideContext = ctx;
  }

  void setData(int moodType, String content) {
    this.moodType = moodType;
    this.content = content;
    notifyListeners();
  }

  void setIcon(String icon) {
    this.moodIcon = icon;
    notifyListeners();
  }

  String getDataContent() {
    return this.content;
  }

  int getDataMoodType() {
    return this.moodType;
  }

  String getMoodIcon() {
    return this.moodIcon;
  }

  closeEntry() {
    if (this.enrty != null) {
      this.enrty.remove();
    }
  }
}
