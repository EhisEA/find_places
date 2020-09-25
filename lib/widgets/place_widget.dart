import 'package:flutter/material.dart';
import 'package:find_places/views/result_view.dart';

class PlaceWidget extends StatelessWidget {
  final double space;
  final CustomClipper clipper;
  final String image;
  final String place;
  PlaceWidget({
    Key key,
    @required this.space,
    @required this.clipper,
    @required this.image,
    @required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: space,
            ),
            ClipPath(
              clipper: clipper,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultView(
                        placeToFind: place,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 410,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    child: Center(
                      child: Text(
                        place,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
