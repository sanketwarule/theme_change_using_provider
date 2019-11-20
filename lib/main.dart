import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/theme_bloc.dart';
import 'login/login_form.dart';

final GlobalKey navigator = GlobalKey<NavigatorState>(debugLabel: 'AppNavigator');

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeBloc>.value(value: ThemeBloc()),
      ],
      child: App()),
);



class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ThemeData getMyTheme(BuildContext context){
      final ThemeBloc themeBloc = Provider.of<ThemeBloc>(context);
      return themeBloc.theme;
    }

    Future getDetailsFromSharedPref() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.getBool('isDark') == null
          ? false
          : await prefs.getBool('isDark');
    }

    return MaterialApp(
      theme: getMyTheme(context),
      home: Login(), //Login
    );
  }
}