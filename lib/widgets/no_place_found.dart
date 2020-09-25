import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoPlaceFound extends StatelessWidget {
  NoPlaceFound({Key key}) : super(key: key);
final String assetName = 'assets/images/empty_result.svg';

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(
  assetName,
  semanticsLabel: 'A red up arrow'
);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2 - 50,
              child:svgIcon,),// Image.asset("assets/images/void.png")),
          Text(
            "Nothing to show",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
