import 'package:flutter/material.dart';
import 'package:theme_change_using_provider/side_drawer.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text(
          'Sales Infusion',
        ),

      ),
      body: Center(child: Text('DashBoard'),),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
