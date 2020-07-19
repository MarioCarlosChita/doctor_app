
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:doctor_app/ui/helper/UIHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialistDescription extends StatefulWidget
{
  @override
  _SpecialistDescriptionState createState()=>_SpecialistDescriptionState();

}

class _SpecialistDescriptionState extends State<SpecialistDescription>
{
  String text ="Lorem ipsum dolor sit amet consectetur adipisicing elit. "
      "Consectetur excepturi distinctio molestias, repellendus quisquam"
  "debitis exercitationem culpa? Placeat,"
  "nobis esse necessitatibus modi consectetur,"
  "quas, tenetur totam porro iste possimus rem.";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async
      {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0.0,
          title: Align(
              alignment: Alignment.topLeft,
              child: Text('Specialist', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: blueColor))),
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: blueColor,)),

        ),
        body:Container(
          margin: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
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
                                  child: Text('Dr. Natalie Page',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)
                                  ),
                              ),
                           ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                                child: Text('Cardiologist-Apollo Hospital',style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w300)
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: (){
                                        debugPrint('Call');
                                      },
                                      child: Container(
                                        width: 30.0,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          border:Border.all(
                                            color: Colors.blueAccent,
                                            width: 1.5
                                          )
                                        ),
                                        child: Center(child: Icon(Icons.call, color: Colors.blueAccent, size: 20,)),
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceSmall(),
                                    InkWell(
                                      onTap: (){
                                        debugPrint('Message');
                                      },
                                      child: Container(
                                        width: 30.0,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            border:Border.all(
                                                color: Colors.greenAccent,
                                                width: 1.5
                                            )
                                        ),
                                        child: Center(child: Icon(Icons.message, color: Colors.greenAccent, size: 20,)),
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceSmall(),
                                    InkWell(
                                      onTap: (){
                                        debugPrint('Video Call');
                                      },
                                      child: Container(
                                        width: 30.0,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            border:Border.all(
                                                color: Colors.redAccent,
                                                width: 1.5
                                            )
                                        ),
                                        child: Center(child: Icon(Icons.video_call, color: Colors.redAccent, size: 20,)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
              ),
              UIHelper.verticalSpaceMedium(),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Text('About Doctor', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),),
              ),
              UIHelper.verticalSpaceSmall(),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Text('${text}', style:TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black), textAlign: TextAlign.justify,),
              ),
              UIHelper.verticalSpaceMedium(),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Text('Location', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),),
              ),

            ],


          ),
        )
      ),
    );
  }
  
}

