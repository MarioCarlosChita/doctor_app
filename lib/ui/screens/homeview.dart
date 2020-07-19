import 'package:doctor_app/models/user.dart';
import 'package:doctor_app/ui/helper/UIHelper.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:doctor_app/ui/fonts/text_style.dart';
import 'package:doctor_app/ui/screens/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {


  final ValueChanged<int> onPush;

  HomeView({ this.onPush});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    var user =Provider.of<User>(context).username;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image:DecorationImage(
                      image: AssetImage('assets/doctor.png'),
                      fit: BoxFit.cover
                  )
              ), child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('${user}',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,  color: Colors.black)),
            ),
            ),
            ListTile(
              title: Text('Triagem'),
              leading: Icon(Icons.data_usage),
              onTap: (){
                widget.onPush(1);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          slivers: <Widget>[
            const SliverAppBar(
               //forceElevated: true,
                pinned: false,
                floating: true,
                backgroundColor: whiteColor,
                expandedHeight: 40.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Dashboard', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: blueColor)),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.person, size: 25,),
                    tooltip: 'Add new entry',
                  ),
                ]

            ),
            SliverList(
                delegate:SliverChildListDelegate([
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('https://images.unsplash.com/photo-1512785470245-e9c5bf9016d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
                              )
                          ),
                        ),
                        UIHelper.horizontalSpaceSmall(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text('${user}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600) ,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text('Luanda, Miramar',style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w300) ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
                )
            ),
            SliverToBoxAdapter(
              child: Container(
                width: 200.0,
                height: 200.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)=>GestureDetector(
                    onTap: ()=>widget.onPush(index),
                    child: Container(
                      margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(5.0),
                        color:Colors.redAccent,
                      ),
                      child:Padding(
                        padding:  EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            UIHelper.verticalSpaceSmall(),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:Border.all(
                                    color: Colors.black26,
                                    width: 1.0
                                ),
                              ),
                                child: Icon(Icons.favorite, color: whiteColor,)),
                            UIHelper.verticalSpaceMedium(),
                            Text('Minha altura', style:TextStyle(fontSize: 14.0, color: whiteColor),textAlign: TextAlign.justify,),
                            UIHelper.verticalSpaceMedium(),
                            Text('Minha altura', style:TextStyle(fontSize: 14.0, color: whiteColor),textAlign: TextAlign.justify,),
                          ],
                        ),
                      )
                    ),
                  ),
                  itemCount: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

 /* var diseases =Disease.ListOfDiseases();
  var photos =DiseasePhoto.ListOfDiseases();

  @override
  Widget build(BuildContext context) {
   var user =Provider.of<User>(context).username;

   debugPrint('User $user');
    return  Scaffold(
      body: Container(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          slivers: <Widget>[
            const SliverAppBar(
              pinned: false,
              floating: true,
              backgroundColor: whiteColor,
              expandedHeight: 40.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Home', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: blueColor)),
              ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.person, size: 25,),
                    tooltip: 'Add new entry',
                  ),
                ]
            ),
            SliverList(
              delegate: new SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Olá ${user},', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300,)),
                      Text('Encontre a sua', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300,)),
                      Text('Consulta', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                ),
                UIHelper.verticalSpaceLarge(),
                Container(
                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                  height:50,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: TextField(
                      onTap: (){

                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 13.0
                          ),
                          hintText: 'Pesquisar',
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          fillColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.black,

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                              )
                          )
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpaceLarge(),
                Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Categories', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,)),
                          UIHelper.verticalSpaceTooSmall(),
                          Text('23 Total', style:TextStyle(fontSize: 13.0, color: unselectedColor)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height:25.0,
                              width: 60.0,
                              child: Center(child: Text('Adult')),
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10.0),
                                color: deepColor,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            Container(
                              height:25.0,
                              width: 60.0,
                              child: Center(child: Text('Child')),
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10.0),
                                color:grey8Color,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                UIHelper.verticalSpaceLarge(),
              ]
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: 200.0,
                height: 200.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)=>GestureDetector(
                    onTap: ()=>widget.onPush(index),
                    child: Container(
                      margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(5.0),
                        color:deepColor,
                        image: DecorationImage(
                          //image: AssetImage('assets/virus.jpeg'),
                          image: photos[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child:  Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('${diseases[index]}', style:TextStyle(fontSize: 14.0, color: whiteColor),textAlign: TextAlign.justify,),
                        ),
                      ),
                    ),
                  ),
                  itemCount: 8,
                ),
              ),
            ),
            SliverList(
              delegate: new SliverChildListDelegate([
                UIHelper.verticalSpaceLarge(),
                Container(
                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Latest Blog', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,)),
                          UIHelper.verticalSpaceTooSmall(),
                          Text('1 Per Day', style:TextStyle(fontSize: 13.0, color: unselectedColor)),
                        ],
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpaceMedium(),
                Container(
                  height: 100.0,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Card(
                    elevation: 5.0,
                    color: whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: InkWell(
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
                          Column(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('How to prevent against COVID-19?',style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400) ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Disease
{
  static List<String> ListOfDiseases()
  {
    return ['Diabetes Care', 'Cough and Cold', 'Fever', 'Heart', 'Diabetes Care', 'Cough and Cold', 'Fever', 'Heart'];
  }
}
class DiseasePhoto
{
  static List<AssetImage> ListOfDiseases()
  {
    List<AssetImage> photos =new List();
    for(int i=0; i<8;i++)
    {
      if(i%2==0)
      {
        photos.add(new AssetImage('assets/heart.jpeg'));
      }
      else{
        photos.add(new AssetImage(('assets/virus.jpeg')));
      }
    }

    return photos;
  }*/
}




