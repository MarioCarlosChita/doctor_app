import 'package:doctor_app/classes/Doctor.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import  'dart:io';


class ServiceDoctor{

  // routing da apis
  String _URL = "http://192.168.1.30:3000/api/registrarUsuario";
  // fim da routing da apis;



  Future GetUploadFile(File _image) async {
    final postUri = Uri.parse(_URL);
    http.MultipartRequest request = http.MultipartRequest('POST', postUri);
    http.MultipartFile multipartFile =
    await http.MultipartFile.fromPath('file',_image.path); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send().then((value) {
      print('this my status code:'+value.statusCode.toString());
      return value;
    });

  }



  Future RegistrarDoctor(Doctor doctor , BuildContext  context) async{
    // cadastrando o paciente
    try{
      http.Response response = await http.post(_URL, body: doctor.toMapDoctor());
      if(response.statusCode >=200 && response.statusCode<=400){
        showDialog(context:context ,builder: (_)=>AlertDialog(
          content:Container(
            width: 200,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle , color: primaryColor, size: 32),
                SizedBox(height:4,),
                Text("Cadastrado com Sucesso", style: TextStyle(
                    color: Colors.green
                ),)
              ],
            ),
          ),
        ));
      }else{
        showDialog<void>(context: context, builder: (_)=>AlertDialog(
          content: Container(
            width: 200,
            height:80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Erro ao cadastrar porfavor tenta novamente!"),
                FlatButton(
                    onPressed:(){
                      Navigator.of(context).pop();
                    },
                    child: Text("Sair" , style: TextStyle(
                      color: Colors.blue ,
                    ),)
                )
              ],
            ),
          ),
        ));
      }
    }catch(e){
          showDialog<void>(context: context, builder: (_)=>AlertDialog(
        content: Container(
          width: 200,
          height:80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Erro de conexão com o servidor"),
              FlatButton(
                  onPressed:(){
                    Navigator.of(context).pop();
                  },
                  child: Text("Sair" , style: TextStyle(
                    color: Colors.blue ,
                  ),)
              )
            ],
          ),
        ),
      ));
     }
    // fim do cadastro do usuario
  }


}
