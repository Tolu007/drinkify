import 'package:hive/hive.dart';
import 'package:water_drinker/model/drinkdata.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_drinker/model/hive_model.dart';

class Models extends ChangeNotifier {
  final String hiveBoxName = "History";
  Box<HiveModel> hiveBox = Hive.box<HiveModel>("History");
  int _suggested = 0;
  int _age = 0;
  int _dailyGoal = 100;
  int _radioValue = -1;
  int _waterPercentage = 0;
  double _dropHeight = 0;
  int _progress = 0;
  int _weekly = 0;
  int _weeklyDate = -1;
  final List<String> _finalHistoryData = [];
  Color _targetHit = Colors.black;
  int _drinkdataid = 0;
  String _getData = "";
  DrinkData senduserdata = DrinkData();
  DrinkData getuserdata = DrinkData();
  List<String> _idKeys = [];

  Map<String, String> dailyHistory = {};

  int get suggested => _suggested;
  int get age => _age;
  int get dailyGoal => _dailyGoal;
  int get radioValue => _radioValue;
  int get waterPercentage => _waterPercentage;
  int get drinkdataid => _drinkdataid;
  double get dropHeight => _dropHeight;
  int get progress => _progress;
  int get weekly => _weekly;
  int get weeklyDate => _weeklyDate;
  List get finalHistoryData => _finalHistoryData;
  String get getData => _getData;
  List get idKeys => _idKeys;

  Color get targetHit => _targetHit;

  void loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _suggested = pref.getInt('suggested') ?? 0;
    _age = pref.getInt('age') ?? 0;
    _dailyGoal = pref.getInt('dailyGoal') ?? 100;
    _radioValue = pref.getInt('radioValue') ?? -1;
    _waterPercentage = pref.getInt('waterPercentage') ?? 0;
    _dropHeight = pref.getDouble('dropHeight') ?? 0;
    _progress = pref.getInt('progress') ?? 0;
    _weekly = pref.getInt('weekly') ?? 0;
    _weeklyDate = pref.getInt('weeklyDate') ?? DateTime.now().weekday;
    _drinkdataid = pref.getInt('drinkId') ?? 0;
    _getData = pref.getString('$_drinkdataid') ?? "";
    _idKeys = pref.getStringList('lists') ?? [];
    int timestamp = pref.getInt('today') ?? 0;
    DateTime now = DateTime.now();

    // print(pref.getKeys());
    //sharedPreferences weekly reset
    if (now.weekday == 7 && _weeklyDate != 7) {
      pref.setInt('weeklyDate', 7);
      _weeklyDate = 7;
      _weekly = 0;
    }

    //sharedPreferenced daily reset
    if (now.day != timestamp) {
      pref.setDouble('dropHeight', 0.0);
      _dropHeight = 0;
      pref.setInt("progress", 0);
      _progress = 0;
      pref.setInt('waterPercentage', 0);
      _waterPercentage = 0;
      pref.setInt('drinkId', 0);
      _drinkdataid = 0;
      timestamp = DateTime.now().day;
      //clear database every 24 hours
      hiveBox.clear;
      pref.setInt('today', timestamp);
    }

    notifyListeners();
  }

  uploadIntData(String keys, int value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(keys, value);
  }

  uploadDoubleData(String keys, double value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble(keys, value);
  }

  uploadStringData(String keys, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(keys, value);
  }

  uploadListData(List<String> lists) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('list', lists);
  }

  ageSlider(int ageSlider) {
    _age = ageSlider;
    notifyListeners();
  }

  dailyGoals(int dailySlider) {
    _dailyGoal = dailySlider;
    notifyListeners();
  }

  radioButton(int value) {
    _radioValue = value;
    notifyListeners();
  }

  waterPercent(int quantity) {
    hiveBox = Hive.box<HiveModel>(hiveBoxName);
    _weekly = _weekly + quantity;
    _waterPercentage = _waterPercentage + quantity;
    _progress = _progress + quantity;

    waterflow();
    String dayDate = DateTime.now().day.toString();
    String monthDate = DateTime.now().month.toString();
    String yearDate = DateTime.now().year.toString();
    String date = dayDate + '/' + monthDate + '/' + yearDate;

    int unMinuteDate = DateTime.now().minute;
    int unHourDate = DateTime.now().hour;

    String minuteDate = DateTime.now().minute.toString();
    String hourDate = DateTime.now().hour.toString();

    if (unMinuteDate < 10) {
      minuteDate = '0' + DateTime.now().minute.toString();
    }

    if (unHourDate < 10) {
      hourDate = '0' + DateTime.now().hour.toString();
    }
    String time = hourDate + ':' + minuteDate;

    senduserdata.date = date;
    senduserdata.time = time;
    senduserdata.quantity = quantity.toString();
    uploadIntData('weekly', _weekly);
    HiveModel hive = HiveModel(date: date, time: time, quantity: quantity);
    hiveBox.add(hive);
    //uploadStringData('$_drinkdataid', jsonEncode(senduserdata));
    _idKeys.add('$_drinkdataid');
    uploadListData(_idKeys);
    uploadIntData("progress", _progress);
    uploadIntData("waterPercentage", _waterPercentage);
    _drinkdataid++;
    uploadIntData('drinkId', _drinkdataid);
    notifyListeners();
  }

  waterflow() {
    _dropHeight = (((_progress * 100) / _dailyGoal) * 200) / 100;
    if (_dropHeight >= 200) {
      _dropHeight = 200;
      _targetHit = Colors.lightBlue;
    }
    uploadDoubleData("dropHeight", _dropHeight);
    notifyListeners();
  }

  suggestBody() {
    if (_age < 9) {
      _suggested = 120;
    } else if (_age > 8 && _age < 14) {
      _suggested = 190;
    } else if (_age > 13 && _age < 19) {
      _suggested = 260;
    } else if (_age > 18 && _radioValue == 0) {
      _suggested = 390;
    } else if (_age > 18 && _radioValue == 1) {
      _suggested = 280;
    }
    uploadIntData("suggested", _suggested);
    notifyListeners();
  }
}
