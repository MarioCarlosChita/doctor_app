
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:doctor_app/ui/helper/UIHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_html_view/flutter_native_html_view.dart';

class ProfileView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileViewState();
  }
}
class ProfileViewState extends State<ProfileView>
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 8.0, top: 16.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 100.0,
              margin: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 150.0,
                    margin: EdgeInsets.only(left: 0.0, top: 8.0, right: 8.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage('assets/virus.jpeg'),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                          child: Text('Natalie Page',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Text('Luanda, Miramar',style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w300)
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text('Dados do usuario',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600)
                ),
              ),
            UIHelper.verticalSpaceMedium(),
           //Copiar codigo-fonte do MC - Registrar
            UIHelper.verticalSpaceMedium(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text('Actividades Recentes',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600)
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Container(
              height: 200.0,
                width: 400.0,
              child:ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)=>GestureDetector(
                 // onTap: ()=>widget.onPush(index),
                  child: Container(
                    width: 150.0,
                    height: 1000,
                    child: Card(
                     color: whiteColor,
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        margin: EdgeInsets.only(left: 8.0, right: 0.0, top:0.0, bottom: 8.0 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
                              width: 120.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10.0),
                                color:deepColor,
                                image: DecorationImage(
                                  //image: AssetImage('assets/virus.jpeg'),
                                  image: AssetImage('assets/heart.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child:  Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  //child: Text('Diabete', style:TextStyle(fontSize: 14.0, color: whiteColor),textAlign: TextAlign.justify,),
                                ),
                              ),
                            ),
                            UIHelper.verticalSpaceSmall(),
                            Container(
                              child: Text('DIABET TEST', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),),
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
                itemCount: 3,
              ),
            ),
        ]
      ),
    )
    );
  }

}
