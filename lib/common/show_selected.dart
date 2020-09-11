import 'package:flutter/material.dart';
import 'const.dart';
import 'functions.dart';

void main() => runApp(ShowSelected());

class ShowSelected extends StatefulWidget {
  @override
  _ShowSelected createState() => new _ShowSelected();
}

class _ShowSelected extends State<ShowSelected> {
  bool showForm = false;
  bool showFinish = false;
  bool showSaving = false;
  String showFormMoodIcon;
  int selectedMoodType = MoodTypeHappy;

  @override
  void initState() {
    super.initState();
  }

  //弹出心情form表单
  void showTextarea(int moodType) {
    GlobalForm form = new GlobalForm();
    form.setData(moodType, "");
    form.setIcon(setMoodIconByType(moodType));
    form.setContext(context);
    form.setEntry(formOverlayEntry);
  }

  String setMoodIconByType(int moodType) {
    if (moodType == MoodTypeSad) {
      return IconMoodSad;
    } else if (moodType == MoodTypeMormal) {
      return IconMoodNormal;
    } else {
      return IconMoodHappy;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double paddingRight = 30 / 1.0;
    double paddingLeft = 30 / 1.0;
    double width = size.width / 1.0;
    return Expanded(
        child: Column(
      children: [
        Container(
            width: width - paddingRight - paddingLeft,
            height: 50,
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {
                showTextarea(MoodTypeHappy);
              },
              color: Color.fromARGB(100, 200, 200, 200),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              IconMoodHappy,
                              width: 30,
                            ),
                          ),
                          Text(
                            IconMoodHappyText,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(217, 0, 0, 0)),
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
                showTextarea(MoodTypeMormal);
              },
              color: Color.fromARGB(100, 200, 200, 200),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              IconMoodNormal,
                              width: 25,
                            ),
                          ),
                          Text(
                            IconMoodNormalText,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(180, 0, 0, 0)),
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
              onPressed: () {
                showTextarea(MoodTypeSad);
              },
              color: Color.fromARGB(100, 200, 200, 200),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              IconMoodSad,
                              width: 20,
                            ),
                          ),
                          Text(
                            IconMoodSadText,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(140, 0, 0, 0)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
