import 'package:flutter/material.dart';
import 'package:today_feeling/model/app_base.dart';
import 'controller/calendar_controller.dart';
import 'controller/home_controller.dart';
import 'const/const.dart';
import 'controller/splash_controller.dart';
import 'components/footer.dart';

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
  AppBaseModel appBase;

  @override
  void initState() {
    appBase = new AppBaseModel();
    super.initState();
  }

  currentPage() {
    switch (appBase.getNowTab()) {
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
          title: Text(appBase.getAppTitle()),
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
          child: ButtomFooter(),
        ));
  }
}
