import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends ChangeNotifier{

  ThemeData _theme;
  bool isDark;


  get theme{

    getDetailsFromSharedPref().then((isDark)=> isDark = isDark);

    if(isDark){
      _theme = dark();
    }else{
      _theme = light();
    }
    return _theme;


  }

  set theme(ThemeData _themeVal){
    _theme = _themeVal;
    notifyListeners();
  }

  dark(){
    theme = ThemeData.dark();
    saveDetailsToSharedPref(true);
  }

  light(){
    theme = ThemeData.light();
    saveDetailsToSharedPref(false);
  }


  saveDetailsToSharedPref(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  Future getDetailsFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getBool('isDark') == null){
      return isDark = false;
    }else{
      prefs.getBool('isDark');
    }
//    return prefs.getBool('isDark') == null
//        ? false
//        : prefs.getBool('isDark');
  }

}