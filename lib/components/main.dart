import 'package:flutter/material.dart';
import '../model/app_base.dart';
import 'package:provider/provider.dart';
import '../components/footer.dart';
import '../controller/calendar_controller.dart';
import '../controller/home_controller.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _Main createState() => new _Main();
}

class _Main extends State<Main> {
  @override
  void initState() {
    super.initState();
  }

  currentPage(nowTab) {
    switch (nowTab) {
      case 1:
        return new Calendar();
        break;
      default:
        return new Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBaseModel>(builder: (context, obj, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text(obj.getAppTitle()),
            actions: <Widget>[
              // Row(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.only(right: 13),
              //       child: Image.asset(
              //         IconShare,
              //         width: 20,
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
          body: SafeArea(child: this.currentPage(obj.getNowTab())),
          bottomNavigationBar: SafeArea(
            child: ButtomFooter(),
          ));
    });
  }
}
