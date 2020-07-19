
import 'package:doctor_app/enums/enums.dart';
import 'package:doctor_app/locator.dart';
import 'package:doctor_app/service/api.dart';
import 'package:doctor_app/service/authentication_service.dart';
import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier{

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage;

  ViewState _state=ViewState.Idle;
  ViewState get state =>_state;

  void setState(ViewState state)
  {
    _state =state;
    notifyListeners();
  }

  Future<bool> login({String userIdText,String userEmail, String userPassword}) async {

    // The state is busy, because is starting to get user login authentication
    setState(ViewState.Busy);

    var success = await _authenticationService.login(userEmail, userPassword);
    if(success==false){
      errorMessage=Api.error;
    }
    setState(ViewState.Idle);
    return success;
  }


  /*//SignInWithGoogle - Click on
  Future<bool> signWithGoogle() async {

    setState(ViewState.Busy);

    var success =await _authenticationService.signInWithGoogle();

    if(success!=null && success.length>0)
    {
      errorMessage=Api.error;
    }

    setState(ViewState.Idle);
    return success!=null && success.length>0;
  }*/
}