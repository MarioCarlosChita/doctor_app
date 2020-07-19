import 'package:doctor_app/classes/UserLocation.dart';
import 'package:trust_location/trust_location.dart';
import 'package:doctor_app/service/BlocLocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:flutter_native_html_view/flutter_native_html_view.dart';
import '../colors/colorsUI.dart';
import '../colors/colorsUI.dart';
import '../colors/colorsUI.dart';
import '../colors/colorsUI.dart';
import '../colors/colorsUI.dart';

class Dev extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     child: Center(
       child: Text('Appointment', style: TextStyle(color: Colors.green),),
     ),
   );
  }

}

class AppointmentView extends StatefulWidget
{
  @override
  _AppointmentViewState createState()=>_AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
{
  // this are the user position
  bool _isMockLocation;
  BlocLocation _geolocation  = new BlocLocation();
  GlobalKey<FormState> current = new GlobalKey<FormState>();
  TextEditingController  _pesquisa = new TextEditingController();

  String MapRequestWeb(double latitude, double logitude){
    return """
   <html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/leaflet.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/leaflet.js"></script>
        <script src="https://www.mapquestapi.com/sdk/leaflet/v2.2/mq-map.js?key=at1qo4SU7uQ2n8fj5DVQAvgIU9ZGYBV8"></script>
        <script src="https://www.mapquestapi.com/sdk/leaflet/v2.2/mq-routing.js?key=at1qo4SU7uQ2n8fj5DVQAvgIU9ZGYBV8"></script>
        <script type="text/javascript">
            window.onload = function() {
                var map,
                    dir;
                map = L.map('map', {
                    layers: MQ.mapLayer(),
                    center: [${latitude},${logitude}],
                    zoom: 15
                });
                dir = MQ.routing.directions();
                dir.route({
                    locations: [
                        { latLng: 
                            {lat:${latitude},lng:${logitude}}
                        },
                        { latLng: 
                            { lat:-8.7939185, lng: 13.3273338 }
                        },
                                     
                    ],
                });
                map.addLayer(MQ.routing.routeLayer({
                    directions: dir,
                    fitBounds: true
                }));
            }
        </script>
    </head>
    <body style='border:0; margin: 0'>
        <div id='map' style='width: 100%; height:100vh;'></div>
    </body>
</html>     
""";
  }



  Future<void> getLocation() async {
    try {
      TrustLocation.onChange.listen((values) => setState(() {
        _geolocation.Add(UserLocation(
            lat:double.parse(values.latitude),
            long:double.parse(values.longitude)
        ));
        // dados do mapgeolocation;
        _isMockLocation = values.isMockLocation;
      }));
    } on PlatformException catch (e) {
      print('PlatformException $e');
    }
  }
  /// request location permission at runtime.
  void requestLocationPermission() async {
    PermissionStatus permission =
    await LocationPermissions().requestPermissions();
    print('permissions: $permission');
  }

  void dispose(){
    super.dispose();
    TrustLocation.stop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestLocationPermission();
    TrustLocation.start(30);
    getLocation();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
         centerTitle: true,
         iconTheme:IconThemeData(
            color: blueColor
         ),
         leading: IconButton(
             icon: Icon(Icons.arrow_back),
             onPressed:(){}
             ),
         backgroundColor:Colors.white,
         title: Text("Visualização da Rota" , style: TextStyle(
          color: blueColor,
        ),),
      ),
      body:Container(
        child: StreamBuilder(
            stream: _geolocation.saida,
            builder: (_ ,geolocation){
              if(geolocation.hasData){
                return  Stack(
                  children: [
                     Align(
                         alignment: Alignment.topCenter,
                         child: Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.height,
                           child: FlutterNativeHtmlView(
                             htmlData:MapRequestWeb(geolocation.data.lat, geolocation.data.long),
                             onLinkTap: (String url){
                               print(url);
                             },
                             onError: (String message){
                               print(message);
                             },
                           ),),
                     ),
                     Positioned(
                        top: 10,
                        left: 10, right: 10,
                         child: Container(

                              width: 120,
                              child: Center(
                                 child: Form(
                                    child:TextFormField(
                                      decoration: InputDecoration(
                                         hintText: "Pesquisa por um doctor?",
                                         suffixIcon:IconButton(icon:Icon(Icons.send , color:blueColor,), onPressed: (){}),
                                          prefixIcon:IconButton(icon: Icon(Icons.location_on), onPressed: (){}),
                                         border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                             color: Colors.white
                                          )
                                        )
                                      ),
                                    ) ,
                                 ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50) ,
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.only(
                                 left: 42
                              ),

                             height: 50,
                         )
                     )
                  ],
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: primaryColor,
                  ),
                );
              }
            }
        ),
      ),
    );
  }


}