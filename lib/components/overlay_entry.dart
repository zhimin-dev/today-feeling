import 'package:flutter/material.dart';
import '../const/const.dart';
import 'package:intl/intl.dart';
import '../model/mood_form.dart';
import '../const/overlay_entry.dart';

var loadingOverlayEntry = new OverlayEntry(builder: (context) {
  final size = MediaQuery.of(context).size;
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
              height: OverlayEntryheight * size.height,
              child: new Material(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(CircleRadiusSize),
                    topRight: Radius.circular(CircleRadiusSize)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: PaddingLeft, right: PaddingRight),
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
          height: OverlayEntryheight * size.height,
          child: new Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(CircleRadiusSize),
                topRight: Radius.circular(CircleRadiusSize)),
            child: Padding(
              padding: EdgeInsets.only(left: PaddingLeft, right: PaddingRight),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
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
                      width: size.width - PaddingRight - PaddingLeft,
                      height: 50,
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () {
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
        )
      ]));
});

var formOverlayEntry = new OverlayEntry(builder: (context) {
  final size = MediaQuery.of(context).size;
  double bottomPadding = MediaQuery.of(context).padding.bottom;
  String showFormMoodIcon = IconMoodHappy;
  GlobalForm form = new GlobalForm();
  showFormMoodIcon = form.getMoodIcon();
  form.setContext(context);
  final textFiledController = TextEditingController();
  textFiledController.text = form.getDataContent();
  textFiledController.addListener(() {
    form.setContent(textFiledController.text);
  });
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
            height: OverlayEntryheight * size.height,
            child: new Material(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(CircleRadiusSize),
                  topRight: Radius.circular(CircleRadiusSize)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: PaddingLeft, right: PaddingRight, bottom: 10),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Text(InputMoodFormCancelText),
                            onTap: () {
                              GlobalForm form = new GlobalForm();
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
                              form.closeEntry();
                              form.setEntry(loadingOverlayEntry);
                              Future.delayed(Duration(seconds: 1), () {
                                form.closeEntry();
                                form.setTodayIsSetMood();
                                form.setShowContent();
                                form.setEntry(finishOverlayEntry);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: size.height - 100),
                      child: TextField(
                        focusNode: _focusNode,
                        controller: textFiledController,
                        maxLines: 100,
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
          ),
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
