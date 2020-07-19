import 'package:doctor_app/locator.dart';
import 'package:doctor_app/models/user.dart';
import 'package:doctor_app/routes.dart';
import 'package:doctor_app/service/authentication_service.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:doctor_app/ui/screens/loginview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MainApp createState() => MainApp();
}

class MainApp extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    locator.reset();
    setupLocator();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: User.initial(),
      create: (context)=>locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: primaryColor),
        initialRoute: 'login',
        onGenerateRoute: Router.generateSRoute,
      ),
    );
  }


}