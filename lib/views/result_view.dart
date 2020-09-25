import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:find_places/model/location.dart';
import 'package:find_places/model/place.dart';
import 'package:find_places/services/MarkersServices.dart';
import 'package:find_places/services/place_service.dart';
import 'package:find_places/widgets/no_place_found.dart';
import 'package:find_places/widgets/places_result.dart';
import 'package:provider/provider.dart';

class ResultView extends StatefulWidget {
  final String placeToFind;

  ResultView({Key key, @required this.placeToFind}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  GoogleMapController _controller;

  final MarkersService _markersService = MarkersService();

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final PlaceService _placesService = PlaceService();
    return FutureProvider(
      create: (context) {
        return currentPosition != null
            ? _placesService.getPlaces(currentPosition.latitude,
                currentPosition.longitude, widget.placeToFind)
            : null;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          // statusBarIconBrightness: Brightness.light,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: (currentPosition != null)
              ? Consumer<List<Place>>(
                  builder: (context, places, _) {
                    var markers = places != null
                        ? _markersService.getMarkers(places)
                        : List<Marker>();
                    return Column(
                      children: [
                        buildMap(currentPosition, markers),
                        places != null
                            ? Expanded(
                                child: places.isEmpty
                                    ? NoPlaceFound()
                                    : PlacesResult(
                                        currentPosition: currentPosition,
                                        moveMapTo: moveMapTo,
                                        places: places,
                                      ),
                              )
                            : CircularProgressIndicator(),
                      ],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  buildMap(Position currentPosition, markers) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 16.0,
        ),
        markers: Set<Marker>.of(markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: onMapCreated,
      ),
    );
  }

  onMapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveMapTo(Location location) {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.lat, location.lng),
          zoom: 16.0,
        ),
      ),
    );
  }
}
