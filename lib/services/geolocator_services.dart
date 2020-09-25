

import 'package:geolocator/geolocator.dart';

class GeolocationServices{


  Future<Position> getLocation()async{
    return await getCurrentPosition(desiredAccuracy: LocationAccuracy.high, );
  }

  Future<num> getDistance(double startLatitude, double startLongitude,double endLatitude,double endLongitude)async{
    return  distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);
  }
}