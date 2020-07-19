import 'package:doctor_app/enums/enums.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:doctor_app/ui/helper/UIHelper.dart';
import 'package:doctor_app/ui/fonts/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchUserView extends StatefulWidget
{
  @override
  _SwitchUserViewState createState() =>_SwitchUserViewState();

}

class _SwitchUserViewState extends State<SwitchUserView>
{
  UserType _userType =UserType.Unknown;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: whiteColor,
       elevation: 0.0,
       title: Align(
           alignment: Alignment.topLeft,
           child: Text('Voltar', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: blueColor))),
       leading: InkWell(
           onTap: (){
             Navigator.pop(context);
           },
           child: Icon(Icons.arrow_back, color: blueColor,)),

     ),
     body:Container(
       color: Colors.white,
       margin: EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               _showText(),
               UIHelper.verticalSpaceSmall(),
               _showText1(),
               UIHelper.verticalSpaceSmall(),
               Container(
                 margin: EdgeInsets.only(left:0 ),
                 child: ListTile(
                   title: const Text('Paciente'),
                   leading: Radio(
                     value: UserType.Patient,
                     groupValue:_userType ,
                     onChanged: (UserType value){
                       setState(() {
                         _userType =value;
                       });
                     },
                   ),
                   onTap: (){
                      Navigator.pushNamed(context, 'registerPatient');
                   },
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(left:0 ),
                 child: InkWell(
                   child: ListTile(
                     title: const Text('Enfermeiro(a)/Doutor(a)'),
                     leading: Radio(
                       value: UserType.Doctor,
                       groupValue:_userType ,
                       onChanged: (UserType value){
                         setState(() {
                           _userType =value;
                         });
                       },
                     ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, 'registerDoctor');
                   },
                 ),
               ),
             ],
           ),
       ),

   );
  }
  Widget _showText() {
    return Container(
      margin: EdgeInsets.only(left:30 ),
      child:  Text('Escolha a opção.', style: titleStyle,),
    );
  }
  Widget _showText1() {
    return Container(
      margin: EdgeInsets.only(left:30 ),
      child:  Text('Cadastrar-se como:', style: subtitleStyle,),
    );
  }
}