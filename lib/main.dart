import 'package:flutter/material.dart';
import 'package:today_feeling/common/functions.dart';
import 'calendar/calendar.dart';
import 'home/home.dart';
import 'common/const.dart';
import 'common/splash_screen.dart';
import 'common/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTitle,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        RouterSplasgh: (context) => SplashScreen(),
        RouterHome: (context) => MyHomePage(),
      },
      initialRoute: RouterSplasgh,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nowTab = TabHomeId;
  String title = HomeTitle;

  void setAppBarTitle() {
    if (nowTab == TabCalendarId) {
      title = CalendarTitle;
    } else {
      title = HomeTitle;
    }
  }

  // void _setNowTab(int tabNum) {
  //   setState(() {
  //     this.nowTab = tabNum;
  //     setAppBarTitle();
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  currentPage() {
    switch (nowTab) {
      case 1:
        setAppBarTitle();
        return new Calendar();
        break;
      default:
        setAppBarTitle();
        return new Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
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
        body: SafeArea(child: this.currentPage()),
        bottomNavigationBar: SafeArea(
          child: ButtomFooter(nowTab: nowTab),
        ));
  }
}
