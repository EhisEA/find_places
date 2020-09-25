
import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      double curve=80;
      var  path = Path();
      path.lineTo(0.0, size.height-curve);
      path.quadraticBezierTo(size.width/4, size.height-(curve*2), size.width/2, size.height-curve);
      path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width, size.height-curve);
      path.lineTo(size.width, curve);

      path.quadraticBezierTo(size.width-(size.width/4), (curve*2), size.width/2, curve);
      path.quadraticBezierTo((size.width/4), 0, 0, curve);
      return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) =>true;

}


class TopClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      double curve=80;
      var  path = Path();

      path.lineTo(0.0, size.height-curve);
      path.quadraticBezierTo(size.width/4, size.height-(curve*2), size.width/2, size.height-curve);
      path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width, size.height-curve);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      
      return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) =>true;

}


class BottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      double curve=80;
      var  path = Path();
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
     
      path.lineTo(size.width, curve);

      path.quadraticBezierTo(size.width-(size.width/4), (curve*2), size.width/2, curve);
      path.quadraticBezierTo((size.width/4), 0, 0, curve);
      return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) =>true;

}