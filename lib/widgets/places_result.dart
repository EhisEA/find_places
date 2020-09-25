import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:find_places/model/location.dart';
import 'package:find_places/model/place.dart';
import 'package:find_places/services/geolocator_services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacesResult extends StatelessWidget {
  final List<Place> places;
  final Position currentPosition;
  final Function(Location) moveMapTo;
  const PlacesResult({
    Key key,
    @required this.places,
    @required this.currentPosition,
    @required this.moveMapTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => Card(
        child: FutureProvider(
          create: (context) => GeolocationServices().getDistance(
            currentPosition.latitude,
            currentPosition.longitude,
            places[index].geometry.location.lat,
            places[index].geometry.location.lng,
          ),
          child: ListTile(
            onTap: () => moveMapTo(places[index].geometry.location),
            title: Text(places[index].name, style: TextStyle(color:Colors.teal),),
            trailing: IconButton(
              onPressed: () => _luanchMapUrl(
                  places[index].geometry.location.lat,
                  places[index].geometry.location.lng),
              icon: Icon(Icons.directions, color: Colors.teal),
            ),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              places[index].rating != null
                  ? RatingBarIndicator(
                      itemCount: 5,
                      itemSize: 10,
                      rating: double.parse((places[index].rating).toString()),
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                    )
                  : Center(),
              Consumer<num>(
                builder: (_, meter, __) {
                  return meter != null
                      ? Text(
                          "${places[index].address}  \u00b7 ${meter.round()} mi")
                      : Center();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  _luanchMapUrl(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("url can't launch");
    }
  }
}
