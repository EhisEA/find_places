import 'dart:convert';

import 'package:find_places/constants/key.dart';
import 'package:find_places/model/place.dart';
import 'package:http/http.dart' as http;
class PlaceService{


  // ignore: missing_return
  Future<List<Place>>getPlaces(double lat, double lng, String place) async{
    try{
    var response = await http.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$place&location=$lat,$lng&rankby=distance&key=$google_api_key");
    var jsonData = jsonDecode(response.body);
    var result = jsonData["results"] as List;
    return result.map((place) => Place.fromMap(place)).toList();
    }catch(e){
      print("=====================================================/n $e");
    }
  }
}