import 'package:flutter/material.dart';
import '../const/const.dart';
import '../model/app_base.dart';
import 'package:provider/provider.dart';

void main() => runApp(ButtomFooter());

class ButtomFooter extends StatefulWidget {
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
    return Consumer<AppBaseModel>(builder: (context, obj, _) {
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
                        obj.setNowTab(TabHomeId);
                      },
                      child: Column(
                        children: [
                          obj.getNowTab() == TabHomeId
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
                        obj.setNowTab(TabCalendarId);
                      },
                      child: Column(
                        children: [
                          obj.getNowTab() == TabCalendarId
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
    });
  }
}
