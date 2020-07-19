import 'dart:ui';
import 'dart:io';
import 'package:doctor_app/classes/Doctor.dart';
import 'package:doctor_app/classes/ServiceDoctor.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../main.dart';

class HomeDoctorRegister extends StatefulWidget{
    State<StatefulWidget> createState()=> new HomeDoctor();
}


class HomeDoctor extends State<HomeDoctorRegister>{

  GlobalKey<FormState> _FormState = new GlobalKey<FormState>();

  // dados do doctor
  TextEditingController _nomeCompleto = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _senha = new TextEditingController();
  TextEditingController _endereco = new TextEditingController();
  TextEditingController _telefone  = new TextEditingController();
  String _genero  ="Nenhum" ;
  String _especialidade  = "Nenhuma";
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
  Future getImagefromGallery() async{
    try{
      var image =  await ImagePicker.pickImage(source: ImageSource.gallery , maxWidth: 60 , maxHeight: 60);
      setState(() {});
      _image =image;
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 20,
              ),
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
                    Text("Registrar", style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold ,
                      color: blueColor
                  ),),
                  Container(
                    padding: EdgeInsets.only(
                      top: 30,
                      bottom:50,
                    ),
                    child: Form(
                        key: _FormState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("*Dados do usuario" ,
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold ,
                                    color: blueColor
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

                            SizedBox(height: 5,),
                            TextFormField(
                              controller: _telefone,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                hintText: "Telefone",
                              ),
                            ) ,

                            SizedBox(height:25,),
                            Text("*Dados do Doctor" ,
                                  style: TextStyle(
                                  fontWeight: FontWeight.bold ,
                                  color: blueColor
                              ),
                            ),
                            SizedBox(height:30,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Column(
                                    children: [
                                      Text("Especialidade Medica" , style: TextStyle(
                                        color: Colors.black ,
                                        fontSize: 14,
                                      ),),
                                      DropdownButton<String>(
                                        value: _especialidade,
                                        items: <String>['Nenhuma', 'Ortopedista', 'Pediatra', 'Clínico geral' , 'Enfermeiro' ,'Psicólogo'].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (especialidade) {
                                          setState(() {});
                                          this._especialidade = especialidade;
                                        },
                                      ),
                                    ],
                                 ) ,
                                 SizedBox(width:60,),
                                 Column(
                                    children: [
                                       Text("Genero"),
                                       DropdownButton<String>(
                                        value: this._genero,
                                        items: <String>['Nenhum', 'Masculino', 'Feminino'].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (genero) {
                                          setState(() {});
                                          this._genero = genero;
                                        },
                                      ),

                                    ],
                                 )
                              ],
                            ),
                            SizedBox(height:10,) ,
                            Container(
                                width:double.infinity,
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      maxLines: 2,
                                      controller: _endereco,
                                      decoration: InputDecoration(
                                          hintText: "Endereco" ,
                                          hintStyle: TextStyle(
                                              color: Colors.grey ,
                                          )
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left:(MediaQuery.of(context).size.width/2)*1.6,
                                        child: IconButton(icon:Icon(Icons.add)),
                                    )
                                  ],
                                ),
                            ) ,
                            SizedBox(height: 20,),
                            Center(
                              child: ButtonTheme(
                                minWidth: 220,
                                height: 60,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50) ,
                                ),
                                child: MaterialButton(
                                  onPressed: (){
                                    if(!_FormState.currentState.validate()) return ;
                                    // criando objectos do doctor
                                    Doctor  doctor = new Doctor(
                                        telefone: _telefone.text ,
                                        nomeCompleto: _nomeCompleto.text ,
                                        especialidade: this._especialidade,
                                        endereco: _endereco.text ,
                                        senha: _senha.text ,
                                        email: _email.text,
                                        tipo_Usuario: "2",
                                        genero: this._genero,
                                      );

                                     //cadastrando novo usuario;
                                      ServiceDoctor _addnovo =  new ServiceDoctor();
                                     _addnovo.RegistrarDoctor(doctor, context).whenComplete(() {
                                         // limpando os dados
                                        _telefone.clear();
                                        _nomeCompleto.clear();
                                        _endereco.clear();
                                        _senha.clear();
                                        _email.clear();
                                        _especialidade = null;
                                        _genero =  null;
                                        // fim
                                     });
                                     //  app start
                                      if(_image ==  null){
                                       _addnovo.GetUploadFile(_image).whenComplete(() {
                                         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> MyApp()), (route) => false);
                                       });
                                      }
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> MyApp()), (route) => false);
                                     //fim do cadastrado
                                  },
                                  color:primaryColor ,
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