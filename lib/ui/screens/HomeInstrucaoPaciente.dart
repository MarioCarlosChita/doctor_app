import 'dart:ui';

import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeInstrucaoPaciente extends StatefulWidget{
  State<StatefulWidget> createState()=> new HomeInstrucao();
}

class HomeInstrucao extends  State<HomeInstrucaoPaciente>{

  final  PageController  _pageController = new PageController(initialPage: 0);
  int PagePositionController  = 0;
  @override

  void dispose(){
    _pageController.dispose();
  }
  void OnPageChangeController(int value){
    setState(() {
      this.PagePositionController =  value;
    });

    print(this.PagePositionController);
  }
  void ChangePageControllerPosition(){
    setState(() {
      this.PagePositionController++;
    });
    _pageController.jumpToPage(PagePositionController);
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: OnPageChangeController,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                          height:400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/image1.png")
                              )
                          ),

                        )),
                    SizedBox(height:10,),
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:EdgeInsets.only(
                            left: 10 ,
                            right: 10 ,
                          ),
                          padding: EdgeInsets.only(
                              left: 5,
                              right: 5
                          ),
                          child:Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Find Doctors", style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 22 ,
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height:10,),
                                Text("The fisrt mate and his Skipper too will do"
                                    " their very comfortable in their tropic island"
                                    " nest to till the end." ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey ,
                                  ),
                                ) ,
                                SizedBox(height:20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Container(
                                      height:8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: blueColor,
                                          borderRadius: BorderRadius.circular(50)
                                      ),

                                    ),
                                    SizedBox(width:5,),
                                    Container (
                                      height:6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(50)
                                      ),

                                    ) ,
                                    SizedBox(width: 5,),
                                    Container(
                                      height:6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          color:Colors.grey,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                    ),
                                  ],
                                ) ,
                                SizedBox(height: 20,),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: MaterialButton(
                                    onPressed:()=>ChangePageControllerPosition(),
                                    child:Text("Next" , style: TextStyle(
                                      color: Colors.white ,
                                    ),),
                                    color:blueColor,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(
                                          width: 1,
                                          color: blueColor
                                      )
                                  ),
                                  child: MaterialButton(
                                    onPressed:(){
                                      Navigator.pushNamed(context, '/');
                                    } ,
                                    child:Text("Skip" , style: TextStyle(
                                      color: blueColor,
                                    ),),
                                  ),
                                )

                              ],
                            ),
                          ),

                        ))
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                          height:400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/image2.png")
                              )
                          ),

                        )),
                    SizedBox(height:10,),
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:EdgeInsets.only(
                            left: 10 ,
                            right: 10 ,
                          ),
                          padding: EdgeInsets.only(
                              left: 5,
                              right: 5
                          ),
                          child:Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Find Hospital", style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 22 ,
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height:10,),
                                Text("The fisrt mate and his Skipper too will do"
                                    " their very comfortable in their tropic island"
                                    " nest to till the end." ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey ,
                                  ),
                                ) ,
                                SizedBox(height:20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(50)
                                      ),

                                    ) ,
                                    SizedBox(width:5,),
                                    Container(
                                      height:8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: blueColor,
                                          borderRadius: BorderRadius.circular(50)
                                      ),

                                    ),
                                    SizedBox(width: 5,),
                                    Container(
                                      height:6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          color:Colors.grey,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                    ),
                                  ],
                                ) ,
                                SizedBox(height: 20,),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: MaterialButton(
                                    onPressed:()=>ChangePageControllerPosition(),
                                    child:Text("Next" , style: TextStyle(
                                      color: Colors.white ,
                                    ),),
                                    color:blueColor,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(
                                          width: 1,
                                          color: blueColor
                                      )
                                  ),
                                  child: MaterialButton(
                                    onPressed:(){} ,
                                    child:Text("Skip" , style: TextStyle(
                                      color: blueColor,
                                    ),),
                                  ),
                                )

                              ],
                            ),
                          ),

                        ))
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                          height:300,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/image3.png",),

                              )
                          ),

                        )),
                    SizedBox(height:10,),
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:EdgeInsets.only(
                            left: 10 ,
                            right: 10 ,
                          ),
                          padding: EdgeInsets.only(
                              left: 5,
                              right: 5
                          ),
                          child:Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("The Locations", style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 22 ,
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height:10,),
                                Text("The fisrt mate and his Skipper too will do"
                                    " their very comfortable in their tropic island"
                                    " nest to till the end." ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey ,
                                  ),
                                ) ,
                                SizedBox(height:20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Container(
                                      height:6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(50)
                                      ),

                                    ) ,
                                    SizedBox(width:5,),
                                    Container(
                                      height:6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(50)
                                      ),

                                    ),
                                    SizedBox(width: 5,),
                                    Container(
                                      height:this.PagePositionController == 2 ?8:4,
                                      width: this.PagePositionController == 2 ?8:4,
                                      decoration: BoxDecoration(
                                          color:this.PagePositionController == 2? blueColor:Colors.grey,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                    ),
                                  ],
                                ) ,
                                SizedBox(height: 20,),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: MaterialButton(
                                    onPressed:()=>ChangePageControllerPosition(),
                                    child:Text("Next" , style: TextStyle(
                                      color: Colors.white ,
                                    ),),
                                    color:blueColor,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(
                                          width: 1,
                                          color: blueColor
                                      )
                                  ),
                                  child: MaterialButton(
                                    onPressed:(){} ,
                                    child:Text("Skip" , style: TextStyle(
                                      color: blueColor,
                                    ),),
                                  ),
                                )

                              ],
                            ),
                          ),

                        ))
                  ],
                ),
              ),


            ],
          ),
        )
    );

  }
}