
import 'package:doctor_app/ui/screens/HomeDoctorRegister.dart';
import 'package:doctor_app/ui/screens/HomeInstrucaoPaciente.dart';
import 'package:doctor_app/ui/screens/HomeScreensDocumentDoctor.dart';
import 'package:doctor_app/ui/screens/app.dart';
import 'package:doctor_app/ui/screens/loginview.dart';
import 'package:doctor_app/ui/screens/switchuserview.dart';
import 'package:doctor_app/ui/screens/categoryview.dart';
import 'package:doctor_app/ui/screens/homeview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/screens/HomePacienteRegister.dart';

class Router
{


  static Route<dynamic> generateSRoute(RouteSettings settings){

    switch(settings.name)
    {
      case '/':
        return MaterialPageRoute(builder: (_)=>App());
      case 'login':
        Key key;
        return MaterialPageRoute(builder: (_)=>LoginView());
      case 'switchUser':return MaterialPageRoute(builder: (_)=>SwitchUserView());
      case 'homeWidget':return MaterialPageRoute(builder: (_)=>HomeView());
      case 'categoryWidget':return MaterialPageRoute(builder: (_)=>CategoryView());
      case 'registerPatient':return MaterialPageRoute(builder: (_)=>HomePacienteRegister());
      case 'registerDoctor':return MaterialPageRoute(builder: (_)=>HomeDoctorRegister());
      case 'doctorDocument':return MaterialPageRoute(builder: (_)=> HomeScreensDocumentDoctor());
      case 'instruction':return MaterialPageRoute(builder: (_)=> HomeInstrucaoPaciente());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}