
import 'package:doctor_app/enums/enums.dart';
import 'package:doctor_app/ui/screens/appointmentview.dart';
import 'package:flutter/material.dart';

class TabNavigatorProfileRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigatorAppointment extends StatelessWidget
{
  TabNavigatorAppointment({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  //Missing code here
  void _push(BuildContext context, {int materialIndex:500})
  {

  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, {int materialIndex: 500})
  {
    return {
      TabNavigatorProfileRoutes.root:(context)=>AppointmentView(),
      TabNavigatorProfileRoutes.detail: (context) => Container(
        child: Center(
          child: Text('Appointment', style: TextStyle(color: Colors.green),),
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorProfileRoutes.root,
      onGenerateRoute: (routeSettings)
      {
        return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context));
      },
    );
  }


}