import 'dart:convert';
import 'dart:ui';

import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;



class HomeScreensDocumentDoctor extends StatefulWidget{
     State<StatefulWidget> createState()=> new HomeScreenDocument();
}

class HomeScreenDocument extends State<HomeScreensDocumentDoctor>{

     GlobalKey<FormState> _FormState = new GlobalKey<FormState>();
    TextEditingController   _BI = new  TextEditingController();
    TextEditingController   _Diploma=  TextEditingController();
    TextEditingController   _Cartera_medico = new TextEditingController();

    bool loadingimagedocuments =  false;

     // dados do ficheiros
     File _DocumentBI ;
     File _DocumentDiplome;
     File _DocumentCarteira;


  //  campos do usuario
  bool sucess_BI_loading  = false;
  bool  sucess_Diploma_loading = false;
  bool sucess_Medico_loading  = false;
  // fim  dos dados do usuario;

  Future  getDocumentFilesBI() async{
    File file = await FilePicker.getFile(
       allowedExtensions: ['pdf'],
       type:FileType.custom
    );
    setState(() {
      _DocumentBI  =  file;
      if(_DocumentBI != null ) {
        _BI = new TextEditingController(text:_DocumentBI.path);
        sucess_BI_loading  = true;
      }
    });
  }
  Future  getDocumentFilesDiploma() async{
    File file = await FilePicker.getFile(
        allowedExtensions: ['pdf'],
        type:FileType.custom
    );
    setState(() {
      _DocumentDiplome  =  file;
      if(_DocumentDiplome != null ) {
        _Diploma = new TextEditingController(text:_DocumentDiplome.path);
        sucess_Diploma_loading  = true;
      }
    });
  }

  Future  getDocumentFilesCarteira() async{
    File file = await FilePicker.getFile(
        allowedExtensions: ['pdf'],
        type:FileType.custom
    );
    setState(() {
      _DocumentCarteira  =  file;
      if(_DocumentCarteira != null ) {
        _Cartera_medico = new TextEditingController(text:_DocumentCarteira.path);
        sucess_Medico_loading  = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
       return Scaffold(
         backgroundColor: Colors.white,
           body:Stack(
               children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child:SingleChildScrollView(
                      child:Container(
                        padding: EdgeInsets.only(
                          left: 10 ,
                          right: 10,
                          top: 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:EdgeInsets.only(
                                left:10,
                              ),
                              child: Text("Carregamento de Documentos" , style: TextStyle(
                                color: blueColor  ,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            Divider(
                              color: blueColor,
                            ),
                            SizedBox(height:20,),
                            Form(
                                key: _FormState,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText:  _DocumentBI !=  null ?_DocumentBI.path :"",
                                        labelText:"Carregamento do BI",
                                        prefixIcon:IconButton(
                                          icon:Icon(Icons.library_books, size: 32,color:blueColor,),
                                        ) ,
                                      ),
                                      controller: _BI,
                                      onTap: (){
                                        showDialog(context: context , builder: (_)=>AlertDialog(
                                          title: Text("Carregamento de Documento"),
                                          content: Container(
                                            width: 80,
                                            height: 110,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                MaterialButton(
                                                  onPressed: (){
                                                    getDocumentFilesBI().whenComplete((){
                                                      Navigator.of(context).pop();
                                                    });
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
                                              ],
                                            ),
                                          ),
                                        ));
                                        // carregando os dados na textfield
                                        //fim do carregando dos dados
                                      },
                                    ),
                                    SizedBox(height:20,),
                                    TextFormField(
                                      onTap: (){
                                        showDialog(context: context , builder: (_)=>AlertDialog(
                                          title: Text("Carregamento de Documento"),
                                          content: Container(
                                            width: 80,
                                            height: 110,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                MaterialButton(
                                                  onPressed: (){
                                                    getDocumentFilesDiploma().whenComplete(() {
                                                      Navigator.of(context).pop();
                                                    });

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
                                              ],
                                            ),
                                          ),
                                        ));
                                      },
                                      decoration: InputDecoration(
                                          hintText:  _DocumentDiplome !=  null ? _DocumentDiplome.path :"",
                                          labelText:"Carregamento do Diploma",
                                          prefixIcon:IconButton(
                                            icon:Icon(Icons.library_books, size: 32,color:blueColor,),
                                          )
                                      ),
                                      controller: _Diploma,
                                    ),
                                    SizedBox(height:20,),
                                    TextFormField(
                                      onTap: (){
                                        showDialog(context: context , builder: (_)=>AlertDialog(
                                          title: Text("Carregamento de Documento"),
                                          content: Container(
                                            width: 80,
                                            height: 110,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                MaterialButton(
                                                  onPressed: (){
                                                    // loading  the files
                                                    getDocumentFilesCarteira().whenComplete(() {
                                                      Navigator.of(context).pop();
                                                    });
                                                    // loading  the files

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
                                              ],
                                            ),
                                          ),
                                        ));
                                      },
                                      decoration: InputDecoration(
                                          hintText:  _DocumentCarteira !=  null ? _DocumentCarteira.path :"",
                                          labelText:"Carregamento do Carteira",
                                          prefixIcon:IconButton(
                                            icon:Icon(Icons.library_books, size: 32,color:blueColor,),
                                          )
                                      ),
                                      controller:_Cartera_medico,
                                    ),
                                  ],
                                )) ,
                            SizedBox(height:20,),
                            Center(
                              child:MaterialButton(
                                onPressed: (){
                                  if(!sucess_Medico_loading  || !sucess_Diploma_loading || ! sucess_BI_loading){
                                    showDialog(context: context , builder: (_)=>AlertDialog(
                                      title: Text("Documentos carregados" , style: TextStyle(
                                        color: blueColor ,
                                      ),),
                                      content: Container(
                                          width: 300,
                                          height: 200,
                                          child:ListView(
                                            children: [
                                              Container(
                                                child:Card(
                                                  child:ListTile(
                                                    title: Text(sucess_BI_loading ?"BI selecionado":"BI não selecionado" , style: TextStyle(
                                                    ),),
                                                    subtitle: Text("Documentos obrigatório" , style: TextStyle(
                                                      fontSize: 10,
                                                    ),),
                                                    trailing: sucess_BI_loading ? Icon(Icons.check_circle , color: primaryColor,):
                                                    Icon(Icons.error_outline ,color: Colors.red,),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5,) ,
                                              Container(
                                                child:Card(
                                                  child:ListTile(
                                                    title: Text(sucess_Diploma_loading ?"Diploma selecionado":"Diploma não selecionado" , style: TextStyle(
                                                    ),),
                                                    subtitle: Text("Documentos obrigatório" , style: TextStyle(
                                                      fontSize: 10,
                                                    ),),
                                                    trailing: sucess_Diploma_loading ? Icon(Icons.check_circle , color: primaryColor,):
                                                    Icon(Icons.error_outline ,color: Colors.red,),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5,) ,
                                              Container(
                                                child:Card(
                                                  child:ListTile(
                                                    title: Text(sucess_Medico_loading ?"Carteira selecionado":"Carteira não selecionado" , style: TextStyle(
                                                    ),),
                                                    subtitle: Text("Documentos obrigatório" , style: TextStyle(
                                                      fontSize: 10,
                                                    ),),
                                                    trailing: sucess_Medico_loading ? Icon(Icons.check_circle , color: primaryColor,):
                                                    Icon(Icons.error_outline ,color: Colors.red,),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ));
                                  }else{
                                    print('iam sending the files');
                                    try{
                                       // creating a loading 
                                      setState(() {
                                        loadingimagedocuments =  true;    
                                      }); 
                                      // creating a news load;
                                      
                                      PostFiles(_DocumentBI ).whenComplete(() {
                                        PostFiles(_DocumentCarteira).whenComplete(() {
                                          PostFiles(_DocumentDiplome).whenComplete(() {
                                            showDialog(context: context , builder: (_)=>AlertDialog(
                                              title: Text("Sucessos de carregamento de ficheios"),
                                              content:FlatButton(
                                                  color: primaryColor,
                                                  onPressed:(){},
                                                  child: Text("Continuar" ,style: TextStyle(
                                                      color: Colors.white
                                                  ),)
                                              ),
                                            ));
                                            setState(() {});
                                            loadingimagedocuments = false;
                                          }) ;
                                        });
                                      });

                                    }catch(error){
                                      print(error);
                                    }

                                  }
                                },
                                minWidth: 260,
                                child: Text("Enviar" , style: TextStyle(
                                    color: Colors.white
                                ),),
                                height: 50,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )  ,
                  ),
                  loadingimagedocuments ? Align(
                     alignment: Alignment.center,
                     child: CircularProgressIndicator(
                       backgroundColor:primaryColor,
                     ),
                  ):SizedBox.shrink()
               ],
           ),
       );
  }


 Future<void> PostFiles(File document) async{
   var stream = new http.ByteStream(DelegatingStream(document.openRead()));
   var length = await document.length();
   var uri = Uri.parse("http://192.168.1.49:3000/api/MedicoFiles");
   var request = new http.MultipartRequest("POST", uri);
   var multipartFile = new http.MultipartFile('file', stream, length,
       filename: basename(document.path));
   //contentType: new MediaType('image', 'png'));
   request.files.add(multipartFile);
   var response = await request.send();
   print("estou a tentar carregar o fil");
   print(response.statusCode);
   response.stream.transform(utf8.decoder).listen((value) {
     print(value);
   });
   print(" fim da linha  do codigo");

  }

}
