import 'package:flutter/material.dart';
import 'package:open_weight/application_localization.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/journal/journalView.dart';
import 'package:open_weight/ui/profile.dart';

import 'application_drawer.dart';

class ApplicationTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      initialIndex: 1,
      length: 2,
      child: Scaffold(
          drawer: ApplicationDrawer(),
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.pink.shade200,
              indicatorWeight: 5,
              labelColor: Colors.pinkAccent.shade50,
              tabs: [
                Tab(
                  icon: Icon(Icons.account_box),
                ),
                Tab(icon: Icon(Icons.calendar_today)),
                // Tab(icon: Icon(Icons.pie_chart_outlined)),
              ],
            ),
            title: Center(
                child: Text(
              AppLocalizations.of(context).title,
              textAlign: TextAlign.center,
            )),
          ),
          body: Container(
            color: appBgColor,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                UserView(),
                JournalView(),
                // JournalSummary(date: today(),)
              ],
            ),
          )),
    );
  }
}
