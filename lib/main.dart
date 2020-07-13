import 'package:flutter/material.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int nowTab = 0;
  void _setNowTab(int tabNum) {
    setState(() {
      this.nowTab = tabNum;
      _tabController.index = tabNum;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, length: 2, initialIndex: this.nowTab);
    _tabController.addListener(() {
      setState(() => nowTab = _tabController.index);
      print("liucheng-> ${_tabController.indexIsChanging}");
    });
  }

  TabController _tabController;

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
      body: Scrollbar(
          child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 69, right: 31.6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text("星期二"),
                                ),
                                Container(
                                  child: Text("2020年7月13日"),
                                )
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                "assets/images/icon-sunny.png",
                                width: 40,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/images/icon-avatar.png",
                                width: 40,
                              ),
                            ),
                            Column(
                              children: [Text("你好，zm"), Text("今天过得怎么样")],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                FlatButton(
                                  onPressed: () {},
                                  color: Colors.blue,
                                  highlightColor: Colors.blue[700],
                                  colorBrightness: Brightness.dark,
                                  splashColor: Colors.grey,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/icon-happy.png",
                                        width: 20,
                                      ),
                                      Text("很不错")
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  color: Colors.blue,
                                  highlightColor: Colors.blue[700],
                                  colorBrightness: Brightness.dark,
                                  splashColor: Colors.grey,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/icon-normal.png",
                                        width: 20,
                                      ),
                                      Text("很一般")
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  color: Colors.blue,
                                  highlightColor: Colors.blue[700],
                                  colorBrightness: Brightness.dark,
                                  splashColor: Colors.grey,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/icon-sad.png",
                                        width: 20,
                                      ),
                                      Text("不太好")
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text("page 2")
          ])),
      bottomNavigationBar: Container(
        height: 46,
        child: Column(
          children: [
            Divider(
              height: 2,
            ),
            Row(
              children: [
                GestureDetector(
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
                GestureDetector(
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
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
