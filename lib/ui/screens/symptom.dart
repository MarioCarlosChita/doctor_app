

import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:doctor_app/ui/fonts/text_style.dart';
import 'package:doctor_app/ui/helper/UIHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Symptom extends StatefulWidget {
  final ValueChanged<int> onPush;

  Symptom({this.onPush});
  @override
  _SymptomState createState() => _SymptomState();
}

class _SymptomState extends State< Symptom> {
  List<bool> inputs = new List<bool>();

 @override
  void initState() {
    // TODO: implement initState
   setState(() {
     for(int i=0;i<10;i++){
       inputs.add(false);
     }
   });
    super.initState();
  }
  void ItemChange(bool val,int index){
    setState(() {
      inputs[index] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        margin: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceSmall(),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, bottom: 4.0),
              child: Text('Selecione o(s) sintoma(s) ',style:titleStyle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text('que estás sentindo ',style:subtitleStyle),
            ),
            UIHelper.verticalSpaceSmall(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView.builder(
                     itemCount: 10,
                    itemBuilder: (BuildContext context, int index){
                      return ListTileTheme(
                        contentPadding: EdgeInsets.all(0),
                        child: CheckboxListTile(
                          activeColor:  blueColor,
                          title: Text('Animate Slowly'),
                          value: inputs[index],
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool val){
                            ItemChange(val, index);
                          }
                        ),
                      );
                    }),
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: blueColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            bool control=false;
                            for(int i=0; i<10; i++){
                              if(inputs[i]){
                                control=true;
                                break;
                              }
                            }
                            if(control){
                              widget.onPush(2);
                            }
                          },
                          child: Center(child: Text('AVANÇAR', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: whiteColor)))),
                    ),
                  ),
                  UIHelper.horizontalSpaceSmall(),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(
                            color: Colors.black26,
                            width: 1.0
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              for(int i=0;i<10;i++){
                                inputs[i]=false;
                              }
                            });
                          },
                          child: Center(child: Text('APAGAR TODOS', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: blueColor)))),
                    ),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpaceSmall(),
          ],
        ),
      ),
    );
  }
}
