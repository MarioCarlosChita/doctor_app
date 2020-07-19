import 'package:doctor_app/classes/UserLocation.dart';
import '../models/user.dart';

class mapUserRequest{



static  String htmlURL  = """
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
                    center: [-8.810586,13.2474274],
                    zoom: 15
                });
                dir = MQ.routing.directions();
                dir.route({
                    locations: [
                        { latLng: 
                            {lat:-8.810586,lng:13.2474274 }
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