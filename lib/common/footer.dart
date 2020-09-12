import 'package:flutter/material.dart';
import '../common/const.dart';
import '../model/app_base.dart';

void main() => runApp(ButtomFooter());

class ButtomFooter extends StatefulWidget {
  ButtomFooter({Key key, this.nowTab}) : super(key: key);

  final int nowTab;

  @override
  _ButtomFooter createState() => new _ButtomFooter();
}

class _ButtomFooter extends State<ButtomFooter> {
  AppBaseModel appBase;

  @override
  void initState() {
    appBase = new AppBaseModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: [
          Divider(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 12),
                child: GestureDetector(
                    onTap: () {
                      appBase.setNowTab(TabHomeId);
                    },
                    child: Column(
                      children: [
                        widget.nowTab == TabHomeId
                            ? Image.asset(
                                IconTodaySelected,
                                width: 26,
                              )
                            : Image.asset(
                                IconTodayUnselected,
                                width: 26,
                              )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 12),
                child: GestureDetector(
                    onTap: () {
                      appBase.setNowTab(TabCalendarId);
                    },
                    child: Column(
                      children: [
                        widget.nowTab == TabCalendarId
                            ? Image.asset(
                                IconCalendarSelected,
                                width: 26,
                              )
                            : Image.asset(
                                IconCalendarUnselected,
                                width: 26,
                              )
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
