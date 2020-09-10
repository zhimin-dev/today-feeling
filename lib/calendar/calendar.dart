import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

void main() => runApp(Calendar());

class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => new _Calendar();
}

class OneMood {
  int day;
  String content;
  int feeling;
  OneMood(this.day, this.content, this.feeling);
  GetContent() {
    return this.content;
  }

  GetMood() {
    return this;
  }
}

class _Calendar extends State<Calendar> {
  ValueNotifier<String> text;
  ValueNotifier<String> selectText;
  DateModel _selectDate;
  CalendarController controller;

  Map<int, OneMood> myMoods = {20200916: new OneMood(20200916, "xxxxx", 1)};

  @override
  void initState() {
    super.initState();

    _selectDate = DateModel.fromDateTime(DateTime.now());
    controller = new CalendarController(
      selectMode: CalendarConstants.MODE_MULTI_SELECT,
      minSelectYear: 2019,
      minSelectMonth: 1,
      maxSelectYear: 2020,
      maxSelectMonth: 12,
      maxMultiSelectCount: 999999999999999999,
      selectedDateTimeList: {DateTime.now(), new DateTime(2020, 9, 16, 0, 0)},
    );

    controller.addMonthChangeListener(
      (year, month) {
        text.value = "$year年$month月";
      },
    );

    controller.addOnCalendarSelectListener((dateModel) {
      if (dateModel.isCurrentMonth) {
        setState(() {
          _selectDate = dateModel;
        });
      }
    });

    text = new ValueNotifier("${DateTime.now().year}年${DateTime.now().month}月");

    selectText = new ValueNotifier(
        "单选模式\n选中的时间:\n${controller.getSingleSelectCalendar()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () => {controller.moveToPreviousMonth()},
                    child: Image.asset(
                      "assets/images/btn-arrow-left.png",
                      width: 40,
                    )),
                ValueListenableBuilder(
                    valueListenable: text,
                    builder: (context, value, child) {
                      return new Text(text.value);
                    }),
                GestureDetector(
                    onTap: () => {controller.moveToNextMonth()},
                    child: Image.asset(
                      "assets/images/btn-arrow-right.png",
                      width: 40,
                    )),
              ],
            ),
          ),
          CalendarViewWidget(
              padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
              margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
              verticalSpacing: 1.0,
              itemSize: 50,
              calendarController: controller,
              weekBarItemWidgetBuilder: () {
                return CustomStyleWeekBarItem();
              },
              dayWidgetBuilder: (dateModel) {
                return DefaultCombineDayWidget(dateModel);
              }),
          Container(
              child: Column(
            children: [
              Text("${_selectDate.getDateTime()}  "),
              Text("${myMoods[20200916].GetContent()}"),
            ],
          ))
        ],
      ),
    ));
  }
}

class CustomStyleWeekBarItem extends BaseWeekBar {
  final List<String> weekList = ["一", "二", "三", "四", "五", "六", "日"];

  @override
  Widget getWeekBarItem(int index) {
    return new Container(
      child: new Center(
        child: new Text(
          weekList[index],
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class DefaultCombineDayWidget extends BaseCombineDayWidget {
  DefaultCombineDayWidget(DateModel dateModel) : super(dateModel);

  @override
  Widget getNormalWidget(DateModel dateModel) {
    var time = dateModel.getDateTime();
    if (dateModel.isCurrentMonth) {
      if (dateModel.isSelected) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            "${time.day}",
            style: TextStyle(color: Colors.grey),
          ),
        );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/icon-date-passed.png",
            width: 20,
          ),
        );
      }
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text(""),
      );
    }
  }

  @override
  Widget getSelectedWidget(DateModel dateModel) {
    if (dateModel.isCurrentMonth) {
      if (dateModel.isSelected) {
        return Container(
          child: Image.asset(
            "assets/images/icon-happy.png",
            width: 20,
          ),
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.blue, width: 5, style: BorderStyle.solid),
            shape: BoxShape.circle,
          ),
        );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/icon-date-passed.png",
            width: 20,
          ),
        );
      }
    }
    return Text("");
  }
}
