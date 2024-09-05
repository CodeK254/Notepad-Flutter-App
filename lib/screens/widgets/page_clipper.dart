import 'package:flutter/material.dart';

class CustomPageClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.lineTo(size.width, 0);
    clippedPath.lineTo(size.width, size.height * .35);
    clippedPath.lineTo(0, size.height * .75);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class CustomReclipClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.lineTo(size.width, 0);
    clippedPath.lineTo(size.width, size.height * .22);
    clippedPath.lineTo(0, size.height * .7);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}