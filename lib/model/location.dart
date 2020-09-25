class Location{
  final double lat;
  final double lng;

  Location(this.lat, this.lng);

  Location.fromMap(Map<dynamic, dynamic > locaion)
  :lat= locaion["lat"],
  lng =locaion["lng"];
}