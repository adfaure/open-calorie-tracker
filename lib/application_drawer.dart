import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';

import 'food/food.dart';

class ApplicationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('My Foods'),
            onTap: () {
              _navigateShowFoodPanel(context);
            },
          ),
          ListTile(
            title: Text('Debug data'),
            onTap: () {
              _debugShowDatabase(context);
            },
          ),
        ],
      ),
    );
  }

  _debugShowDatabase(BuildContext context) async {
    final database = Provider.of<MyDatabase>(context, listen: false);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MoorDbViewer(database)));
  }

  _navigateShowFoodPanel(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListFood(
                title: "Your foods",
              )),
    );
  }
}
