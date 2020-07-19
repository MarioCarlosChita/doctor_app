import 'dart:async';


import 'package:doctor_app/models/user.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'api.dart';


//Abstract class to support User Authentication
abstract class BaseAuth{

  // SignIn if user is registered
  Future<String> signIn(String email, String password) ;

  //SingUp for the FirstTime
  Future<String> signUp(String email, String password);

  //SignOut
  Future<void>signOutGoogle();



}

class AuthenticationService  {
  Api _api = locator<Api>();
  static String error="null";
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String email, String password) async {
      try{
        // int pass =
        var fetchedUser = await _api.getUserProfile(email: email, password: password);
        var hasUser = fetchedUser != null;
        if(hasUser) {
          userController.add(fetchedUser);
        }
        return hasUser;
      }
      on Exception catch(e){
        debugPrint("Erro $e");
      }
    return false;

  }

}