
import 'package:doctor_app/enums/enums.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:flutter/material.dart';



Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.appointment: 'Apontamento',
  TabItem.chat: 'Chat',
  TabItem.search :'Notificação',
  TabItem.person:'Person'
  
};

Map<TabItem, Color> activeTabColor = {
  TabItem.home:  blueColor,
  TabItem.appointment:  blueColor,
  TabItem.chat:  blueColor,
  TabItem.person: blueColor,
  TabItem.search: blueColor

};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.appointment),
        _buildItem(tabItem: TabItem.chat),
        _buildItem(tabItem: TabItem.search),
        _buildItem(tabItem: TabItem.person),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.layers;
    switch(tabItem)
    {
      case TabItem.home:icon = Icons.home;
      break;
      case TabItem.appointment:icon = Icons.calendar_today;
      break;
      case TabItem.chat:icon = Icons.chat;
       break;
      case TabItem.search:icon = Icons.search;
      break;
      case TabItem.person:icon = Icons.person;
      break;

    }

    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(''
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}
