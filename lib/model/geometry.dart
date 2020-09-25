import 'package:find_places/model/location.dart';

class Geometry{
  final Location location;

  Geometry(this.location);

  Geometry.formMap(Map<dynamic, dynamic> geometry):
  location = Location.fromMap(geometry['location']) ;
}