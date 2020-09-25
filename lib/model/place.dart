
import 'package:find_places/model/geometry.dart';

class Place{

  final String name;
  final String address;
  final num rating;
  final int ratingUserCount;
  final Geometry geometry;

  Place({this.name, this.address, this.rating, this.ratingUserCount, this.geometry});

  Place.fromMap(Map<dynamic, dynamic> place):
  geometry= Geometry.formMap(place["geometry"]),
  address= place["vicinity"],
  name= place["name"],
  rating= place["rating"]==null?null:place["rating"],
  ratingUserCount = place["user_ratings_total"]==null?null:place["user_ratings_total"]
  ;
}