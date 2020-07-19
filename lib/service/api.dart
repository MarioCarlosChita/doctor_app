import 'dart:convert';
import 'package:doctor_app/models/symptom.dart';
import 'package:doctor_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {

  //Endpoint
  static const endpoint = 'http://192.168.1.49:3000/api/login';
  static const endpoint1 ='http://192.168.1.49:3000/api/sintomasFind';

  var client = new http.Client();
  static String error="null";

  Future<User> getUserProfile({int userId, String email, String password}) async {
    try{
      debugPrint('email: $email');
      debugPrint('password: $password');
      // Get user profile for id
      var response= await client.post(endpoint , body: {'email': '$email', 'password': '$password'});
      var string =response.body;
      debugPrint('Response body: ${response.body}');
     if(response.statusCode>=200 && response.statusCode<=400)
     {
       // Convert and return
       return User.fromJson(json.decode(response.body));
     }
     else {
       error =response.body;
       return null;
     }
    }
    on Exception {
      //client.close();
      error ="Falha de conexao com servidor";
    }
   return null;
  }

  // ignore: missing_return
  Future<List<Symptom>> symptoms() async
  {
    try{

      var response =await client.get(endpoint1);
      if(response.statusCode>=200 && response.statusCode<=400){

        List<dynamic> symptons=json.decode(response.body);

        return symptons;

      }
      else{
        error =response.body;
        return null;
      }

    }on Exception{
      error ="Falha de conexao com servidor";
    }
  }
}