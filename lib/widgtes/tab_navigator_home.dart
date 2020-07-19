import 'package:doctor_app/ui/screens/categoryview.dart';
import 'package:doctor_app/ui/screens/homeview.dart';
import 'package:doctor_app/ui/screens/specialistdescription.dart';
import 'package:doctor_app/ui/screens/symptom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enums/enums.dart';

class TabNavigatorRoutes
{
  static const String root = '/';
  static const String detail = '/detail';
  static const String specialistDescription='/specialistDescription';
}

class TabNavigatorHome extends StatelessWidget
{
  TabNavigatorHome({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;



  void _push(BuildContext context, {int materialIndex: -1})
  {
    var routeBuilders =_routeBuilders(context, materialIndex: materialIndex);

    if(materialIndex==1){
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>
                  routeBuilders[TabNavigatorRoutes.detail](context)));
    }
    else if(materialIndex==2){
    Navigator.push(context,
        MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.specialistDescription](context)));
    }
  }

  Map<String,WidgetBuilder> _routeBuilders(BuildContext context, {int materialIndex: 500, String key})
  {
    return {
      TabNavigatorRoutes.root: (context) => HomeView(
        onPush: (materialIndex)=>_push(context, materialIndex: materialIndex),
      ),
      TabNavigatorRoutes.detail: (context) =>Symptom(
          onPush: (materialIndex)=>_push(context, materialIndex:  materialIndex)
      ),
      TabNavigatorRoutes.specialistDescription:(context)=>CategoryView(),
      /*  TabNavigatorRoutes.detail: (context) => CategoryView(
        image: photos[materialIndex],
        title: diseases[materialIndex],
        onPush: (key)=>_push(context),
      ),
      TabNavigatorRoutes.specialistDescription:(context)=>SpecialistDescription(),*/
    };
  }

  @override
  Widget build(BuildContext context){
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute:(routeSettings) {
        return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context));
      },
    );
  }
}