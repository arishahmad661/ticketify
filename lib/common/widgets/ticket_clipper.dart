import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double sideRadius = 30.0;
    double midPoint = size.height * 0.5;
    double cornerRadius = 10.0;

    path.moveTo(0, cornerRadius);
    path.lineTo(0, (midPoint - sideRadius));

    //LEFT ARC
    path.quadraticBezierTo(
        sideRadius, midPoint - sideRadius,
        sideRadius, midPoint
    );
    path.quadraticBezierTo(
        sideRadius, midPoint + sideRadius,
        0, midPoint + sideRadius
    );

    path.lineTo(0, size.height - cornerRadius);

    //BottomLeft
    path.quadraticBezierTo(
        0, size.height,
        cornerRadius, size.height
    );

    path.lineTo(size.width - cornerRadius, size.height);

    //BottomRight
    path.quadraticBezierTo(
        size.width, size.height,
        size.width, size.height
    );

    path.lineTo(size.width, (midPoint + sideRadius));


    path.lineTo(size.width, cornerRadius);

    //TopRight
    path.quadraticBezierTo(
        size.width, 0,
        size.width, 0
    );

    path.lineTo(cornerRadius, 0);

    //TopLeft
    path.quadraticBezierTo(
        0, 0,
        0, cornerRadius
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
