import 'package:flutter/material.dart';
import 'calendar/calendar.dart';
import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODAY',
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          "/": (context) => MyHomePage(title: "TODAY"),
        },
        initialRoute: "/",
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            print("route $routeName");
          });
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nowTab = 0;
  void _setNowTab(int tabNum) {
    setState(() {
      this.nowTab = tabNum;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  currentPage() {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Image.asset(
                  "assets/images/icon-share.png",
                  width: 20,
                ),
              )
            ],
          )
        ],
      ),
      body: this.currentPage(),
      bottomNavigationBar: Container(
        height: 70,
        child: Column(
          children: [
            Divider(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: GestureDetector(
                      onTap: () => {this._setNowTab(0)},
                      child: Column(
                        children: [
                          this.nowTab == 0
                              ? Image.asset(
                                  "assets/images/icon-home-selected.png",
                                  width: 26,
                                )
                              : Image.asset(
                                  "assets/images/icon-home.png",
                                  width: 26,
                                )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: GestureDetector(
                      onTap: () => {this._setNowTab(1)},
                      child: Column(
                        children: [
                          this.nowTab == 1
                              ? Image.asset(
                                  "assets/images/icon-calendar-selected.png",
                                  width: 26,
                                )
                              : Image.asset(
                                  "assets/images/icon-calendar.png",
                                  width: 26,
                                )
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
