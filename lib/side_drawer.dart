import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_change_using_provider/screen_a.dart';

import 'bloc/theme_bloc.dart';
import 'dashboard.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  initState() {
    super.initState();
    getDetailsFromSharedPref();
  }

  Future getDetailsFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('isDark') == null
        ? false
        : await prefs.getBool('isDark');
  }

  saveDetailsToSharedPref(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = Provider.of<ThemeBloc>(context);

    return Drawer(
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            FutureBuilder(
              future: getDetailsFromSharedPref(),
              initialData: false,
              builder: (builderContext, snapshot) => ListTile(
                  leading: Icon(Icons.brightness_high),
                  title: Text("Dark Theme"),
                  trailing: Switch(
                      value: snapshot.data,
                      onChanged: (value) {
                        setState(() {
                          saveDetailsToSharedPref(value);
                        });
                        if (value) {
                          themeBloc.dark();
                        } else {
                          themeBloc.light();
                        }
                      })),
            ),
            ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }),
            ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScreenA()));
                },
                leading: Icon(Icons.arrow_forward),
                title: Text("Screen A")),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenB()));
              },
              leading: Icon(Icons.arrow_forward),
              title: Text("Screen B"),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenC()));
              },
              leading: Icon(Icons.arrow_forward),
              title: Text("Screen C"),
            ),

          ],
        ),
      ),
    );
  }

}
