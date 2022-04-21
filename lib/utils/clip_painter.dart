import 'package:flutter/cupertino.dart';

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);
    var secondControlpoint = Offset(
      0,
      0,
    );
    var secondPoint = Offset(width * 0.2, height * 0.3);
    path.quadraticBezierTo(secondControlpoint.dx, secondControlpoint.dy,
        secondPoint.dx, secondPoint.dy);

    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
