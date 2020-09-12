import 'package:flutter/material.dart';

class AppBaseModel extends ChangeNotifier {
  factory AppBaseModel() => _getInstance();
  static AppBaseModel _instance;
  AppBaseModel._();
  static AppBaseModel _getInstance() {
    if (_instance == null) {
      _instance = AppBaseModel._();
    }
    return _instance;
  }

  int nowTab;
  String appTitle;

  void setNowTab(int nowTab) {
    this.nowTab = nowTab;
    notifyListeners();
  }

  void setAppTitle(String title) {
    this.appTitle = title;
    notifyListeners();
  }

  int getNowTab() {
    return this.nowTab;
  }

  String getAppTitle() {
    return this.appTitle;
  }
}
