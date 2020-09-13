import 'package:flutter/material.dart';
import 'package:today_feeling/components/main.dart';
import 'package:today_feeling/model/app_base.dart';
import 'const/const.dart';
import 'controller/splash_controller.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppBaseModel()),
    ], child: Main());
  }
}
