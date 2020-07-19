import 'package:doctor_app/classes/Paciente.dart';
import 'package:doctor_app/service/ServicePaciente.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:doctor_app/ui/screens/HomeUserMap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../main.dart';
import '../../main.dart';
import '../colors/colorsUI.dart';
import '../colors/colorsUI.dart';
import 'loginview.dart';


class HomePacienteRegister extends StatefulWidget{
  State<StatefulWidget> createState()=> new HomeDoctor();
}

class HomeDoctor extends State<HomePacienteRegister> {

  GlobalKey<FormState> _FormState = new GlobalKey<FormState>();

  // os campos para o registro
  TextEditingController _nomeCompleto = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _senha = new TextEditingController();
  TextEditingController _altura = new TextEditingController();
  TextEditingController _peso = new TextEditingController();
  TextEditingController _grupo_sanguineo = new TextEditingController();
  String _genero  ="Masculino" ;

  TextEditingController _data_nascimento =  new TextEditingController();
  DateTime _dataNascimentoUser;

  //
  File _image =  null ;
  // fim dos dados

  // pegando as imagens da Galeria
  Future getImagefromCamera() async{
    try{
      var image =  await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 60,maxHeight: 60);
      setState(() {});
      _image =image;
    }catch(e){
      print(e);
    }
  }
  // fim das imagens


  void dispose(){
    _nomeCompleto.dispose();
    _email.dispose();
    _senha.dispose();
    _altura.dispose();
    _peso.dispose();
    _grupo_sanguineo.dispose();
    _data_nascimento.dispose();
  }
  Future getImagefromGallery() async{
    try{
      var image =  await ImagePicker.pickImage(source: ImageSource.gallery , maxWidth: 60 , maxHeight: 60);
      setState(() {});
      _image =image;
    }catch(e){
      print(e);
    }
  }

  // fim dos campos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
           elevation: 0,
           iconTheme: IconThemeData(
             color: blueColor,
           ),
           leading:IconButton(
               icon: Icon(Icons.arrow_back),
               onPressed: (){
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> MyApp()), (route) => false);
               }
           ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Registrar", style: TextStyle(
                    color: blueColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                ),),
                Container(
                   padding: EdgeInsets.only(
                     top: 15,
                     bottom:50,
                   ),
                    child: Form(
                       key: _FormState,
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Center(
                                 child: InkWell(
                                   onTap: (){
                                     showDialog(context: context , builder: (_)=>AlertDialog(
                                       title: Text("Photo de Perfil"),
                                       content: Container(
                                         width: 80,
                                         height: 110,
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             MaterialButton(
                                               onPressed: (){
                                                 getImagefromGallery() ;
                                                 Navigator.of(context).pop();
                                               },
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(50) ,
                                               ),
                                               minWidth: 200,
                                               child: Text("Galeria", style: TextStyle(
                                                 color: Colors.white,
                                               ),),
                                               color:primaryColor,
                                             ),
                                             SizedBox(height:5,) ,
                                             MaterialButton(
                                               onPressed: (){
                                                 getImagefromCamera();
                                                 Navigator.of(context).pop();
                                               },
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(50) ,
                                               ),
                                               minWidth: 200,
                                               child: Text("Camera", style: TextStyle(
                                                 color: Colors.white,
                                               ),),
                                               color:primaryColor,
                                             ),
                                           ],
                                         ),
                                       ),
                                     ));
                                   },
                                   child: Container(
                                     height:60,
                                     width: 60,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(50) ,
                                         color: primaryColor
                                     ),
                                     child:_image ==null ?Icon(Icons.person_add , color: Colors.white, size:16,):ClipOval(
                                         child: Image.file(_image, fit: BoxFit.cover,height: 60,width: 60,)
                                     ),
                                   ),
                                 )
                             ),

                                Text("*Dados do Usuario" ,
                                style: TextStyle(
                                   fontWeight: FontWeight.bold ,
                                  color: blueColor,
                                ),
                                ),
                                TextFormField(
                                    controller: _nomeCompleto,
                                    decoration: InputDecoration(
                                        hintText:"Nome Completo",
                                    ),
                                    validator: (nome){
                                        if(nome.isEmpty){
                                            return "Inseri o nome porfavor!";
                                        }else{
                                             return null ;
                                        }
                                    },
                                ) ,
                              SizedBox(height:5,),
                             TextFormField(
                               controller: _email,
                               decoration: InputDecoration(
                                 hintText:"Email",
                               ),
                               validator: (email){
                                  if(email.isEmpty){
                                      return "Insira o email porfavor!";
                                  }else{
                                      return null ;
                                  }
                               },
                             ),
                             SizedBox(height:5,),
                             TextFormField(
                               controller: _senha,
                               obscureText:  true,
                               decoration: InputDecoration(
                                 hintText:"Senha",
                               ),
                               validator: (senha){
                                 if(senha.isEmpty){
                                     return "Insira a senha porfavor!";
                                 }else{
                                      return null ;
                                 }
                               },
                             ),

                             SizedBox(height:25,),
                             Text("*Dados do Pessoais" ,
                               style: TextStyle(
                                 fontWeight: FontWeight.bold ,
                                 color: blueColor,
                               ),
                             ),
                             TextFormField(
                               controller: _altura,
                               keyboardType:TextInputType.numberWithOptions(),
                               validator: (altura){
                                   if(altura.isEmpty){
                                        return "Insira a altura porfavor!";
                                   }else{
                                         return null ;
                                   }
                               },
                               decoration: InputDecoration(
                                 hintText:"altura",
                               ),
                             ),
                             SizedBox(height:5,),
                             TextFormField(
                               controller: _peso,
                               validator: (peso){
                                   if(peso.isEmpty){
                                       return "Inseri o peso porfavor!";
                                   }else{
                                        return null ;
                                   }
                               },
                               keyboardType: TextInputType.numberWithOptions(),
                               decoration: InputDecoration(
                                 hintText:"Peso",
                               ),
                             ),
                             SizedBox(height: 10,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Genero" , style: TextStyle(
                                                color: Colors.grey
                                            ),),
                                            DropdownButton<String>(
                                              value: _genero,
                                              items: <String>['Masculino', 'Feminino'].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: new Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (genero) {
                                                setState(() {});
                                                this._genero =  genero;
                                              },
                                            ) ,
                                          ],
                                        ) ,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Nascimento" , style: TextStyle(
                                                color: Colors.grey
                                            ),),
                                            Container(
                                              width:180,
                                              child: TextFormField(
                                                 controller: _data_nascimento,
                                                 decoration: InputDecoration(
                                                    hintText: "Data de Nascimento"
                                                 ),
                                                 onTap: (){
                                                      var data_nascimento =  showDatePicker(
                                                          context: context,
                                                          initialDate: DateTime.now(),
                                                          firstDate: DateTime(2018),
                                                          lastDate: DateTime(2030) ,
                                                      );
                                                      if(data_nascimento  !=  null){
                                                          setState(() {});
                                                          data_nascimento.then((datetime) {
                                                             _dataNascimentoUser =  datetime;
                                                             _data_nascimento =  new TextEditingController(
                                                                 text:_dataNascimentoUser.day.toString()+'/' +_dataNascimentoUser.month.toString() +'/'+_dataNascimentoUser.year.toString()
                                                             );
                                                          });
                                                      }
                                                 },
                                              ),
                                            )
                                          ],
                                        ) ,
                                      ],
                                  )
                               ],
                             ),
                             SizedBox(height:10,),
                             TextFormField(
                               controller: _grupo_sanguineo,
                               decoration: InputDecoration(
                                 hintText:"Grupo Sanguineo",
                               ),
                             ),
                             SizedBox(height:10,) ,
                             Center(
                                child: ButtonTheme(
                                  minWidth: 220,
                                  height: 60,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50) ,
                                  ),
                                  child: MaterialButton(
                                    onPressed: (){
                                      if(!_FormState.currentState.validate()) return;

                                      // Objecto do paciente
                                      Paciente novoPaciente =  Paciente(
                                        senha: _senha.text ,
                                        peso: _peso.text,
                                        email: _email.text,
                                        genero: _genero,
                                        altura: _altura.text,
                                        grupo_sanguineo: _grupo_sanguineo.text ,
                                        data_nascimento: _data_nascimento.text ,
                                        nomecompleto: _nomeCompleto.text,
                                        tipo_Usuario: "1",
                                      );
                                      // Paciente;

                                      // adicionanod om paciente na BD
                                      ServicePaciente adicionar =  new ServicePaciente();
                                      adicionar.RegistrarPaciente(novoPaciente, context).whenComplete(() {
                                        //limpando os dados do usuario
                                        _nomeCompleto.clear();
                                        _data_nascimento.clear();
                                        _grupo_sanguineo.clear();
                                        _altura.clear();
                                        _email.clear();
                                        _senha.clear();
                                        _peso.clear();
                                        _dataNascimentoUser = null ;
                                        // fim do limpando dos dados
                                      });
                                      if(_image != null){
                                        adicionar.GetUploadFile(_image).whenComplete(() {
                                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> MyApp()), (route) => false);
                                        });
                                      }
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> MyApp()), (route) => false);
                                      // field of routin user ;
                                       // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomeUserMap()));                                        // end;
                                    },
                                    color: primaryColor,
                                    child: Text("Registra-se", style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                  ),
                                ),
                             )
                           ],
                        )
                    ),
                )
              ],
            ),
          ),
        )
    );
  }



}
