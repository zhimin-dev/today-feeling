import 'package:flutter/material.dart';
import 'package:today_feeling/const/const.dart';

class GlobalForm extends ChangeNotifier {
  factory GlobalForm() => _getInstance();
  static GlobalForm _instance;
  GlobalForm._() {
    this.setMoodIconByType(MoodTypeHappy);
  }
  static GlobalForm _getInstance() {
    if (_instance == null) {
      _instance = GlobalForm._();
    }
    return _instance;
  }

  int moodType;
  String content = "";
  String showContent = "";
  String moodIcon = "";
  bool isSetToday = false;
  OverlayEntry enrty;

  BuildContext outsideContext;

  void setEntry(OverlayEntry entry) {
    if (entry != null) {
      this.enrty = entry;
      Overlay.of(this.outsideContext).insert(entry);
    }
  }

  void setTodayIsSetMood() {
    this.isSetToday = true;
    notifyListeners();
  }

  bool getTodayIsSetMood() {
    return this.isSetToday;
  }

  void setShowContent() {
    this.showContent = this.content;
    notifyListeners();
  }

  String getShowContent() {
    return this.showContent;
  }

  void setContext(BuildContext ctx) {
    this.outsideContext = ctx;
  }

  void setData(int moodType, String content) {
    this.setMoodType(moodType);
    this.setContent(content);
    notifyListeners();
  }

  void setContent(String content) {
    this.content = content;
    notifyListeners();
  }

  void setMoodType(int moodType) {
    this.moodType = moodType;
    this.moodIcon = setMoodIconByType(moodType);
    notifyListeners();
  }

  String setMoodIconByType(int moodType) {
    if (moodType == MoodTypeSad) {
      return IconMoodSad;
    } else if (moodType == MoodTypeMormal) {
      return IconMoodNormal;
    } else {
      return IconMoodHappy;
    }
  }

  String getDataContent() {
    return this.content;
  }

  int getDataMoodType() {
    return this.moodType;
  }

  String getMoodIcon() {
    return this.moodIcon;
  }

  closeEntry() {
    if (this.enrty != null) {
      this.enrty.remove();
    }
  }
}
