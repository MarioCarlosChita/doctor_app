
import 'package:doctor_app/routes.dart';
import 'package:doctor_app/ui/fonts/text_style.dart';
import 'package:doctor_app/ui/helper/AddHelper.dart';
import 'package:doctor_app/ui/helper/UIHelper.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget
{

  final ValueChanged<String> onPush;

  CategoryView({this.onPush});

  @override
  _CategoryViewState createState()=>_CategoryViewState();

}

class _CategoryViewState extends State<CategoryView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        title: Align(
            alignment: Alignment.topLeft,
            child: Text('', style:titleStyle)
        ),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: blueColor,)
        ),
      ),
      body: Center(
        child: Text('Msrt', ),
      ),
    );
  }

}
/*

class _CategoryViewState extends State<CategoryView>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0.0,
          title: Align(
              alignment: Alignment.topLeft,
              child: Text('Find doctor', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: blueColor))),
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: blueColor,)),

        ),
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Container(
                width: AddHelper.screenHeight(context),
                height: 250.0,
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10.0),
                    color: deepColor,
                    image: DecorationImage(
                      //image: AssetImage('assets/virus.jpeg'),
                      image: widget.image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('${widget.title}', style:TextStyle(fontSize: 20.0, color:whiteColor, fontWeight: FontWeight.w700),textAlign: TextAlign.justify,),
                  ),
                ),
              ),

            UIHelper.verticalSpaceLarge(),
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text('Doctors', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,),),
            ),
            UIHelper.verticalSpaceMedium(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index)=>
                    Container(
                      height: 80.0,
                      margin: EdgeInsets.only(bottom: 8.0, left: 8.0, top: 0.0),
                      child: Card(
                        elevation: 5.0,
                        color: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: InkWell(
                          onTap: (){
                           widget.onPush('SPECIALIST_TOKEN_ID');
                          },
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:AssetImage('assets/virus.jpeg'),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 4.0, right: 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 0.0),
                                        child: Text('Doctor Paul Rob',style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600) ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 0.0),
                                        child: Text('Cardiologist',style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w300) ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                itemCount: 8,),
            )
          ],
        ),

      ),
    );
  }
}*/
