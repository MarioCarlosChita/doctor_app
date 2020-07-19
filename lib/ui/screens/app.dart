
import 'package:doctor_app/enums/enums.dart';
import 'package:doctor_app/widgtes/bottom_navigation.dart';
import 'package:doctor_app/widgtes/tab_navigator_appointment.dart';
import 'package:doctor_app/widgtes/tab_navigator_user_profile.dart';
import 'package:flutter/material.dart';
import '../../widgtes/tab_navigator_home.dart';

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  //final navigatorKey = GlobalKey<NavigatorState>();
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.appointment: GlobalKey<NavigatorState>(),
    TabItem.chat: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.person: GlobalKey<NavigatorState>(),
  };

  TabItem currentTab = TabItem.home;
  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildOffstageNavigatorUI(TabItem.home,
              TabNavigatorHome(tabItem: TabItem.home,navigatorKey: navigatorKeys[TabItem.home],)),
          buildOffstageNavigatorUI(TabItem.appointment,
              TabNavigatorAppointment(tabItem: TabItem.appointment,navigatorKey: navigatorKeys[TabItem.appointment],)),
          buildOffstageNavigatorUI(TabItem.chat,
              TabNavigatorAppointment(tabItem: TabItem.chat,navigatorKey: navigatorKeys[TabItem.chat],)),
          buildOffstageNavigatorUI(TabItem.search,
              TabNavigatorAppointment(tabItem: TabItem.search,navigatorKey: navigatorKeys[TabItem.search],)),
          buildOffstageNavigatorUI(TabItem.person,
              TabNavigatorProfile(tabItem: TabItem.person,navigatorKey:navigatorKeys[TabItem.person],)),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }


  Widget buildOffstageNavigatorUI(TabItem tabItem, Widget widget) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: widget,
    );
  }
 

}
