import 'dart:async';

import 'package:doctor_app/classes/UserLocation.dart';

class BlocLocation {
     UserLocation novo ;
     static StreamController<UserLocation> controller = new StreamController.broadcast();
     Stream<UserLocation> saida = controller.stream;

    Add(UserLocation novo){
       this.novo =  novo ;
       controller.sink.add(this.novo);
    }

}