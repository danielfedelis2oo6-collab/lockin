import 'package:flutter/material.dart';

class AppbarCurvedEdges extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    // 1. The start of the bulge (Left Corner)
    // Control point is at the absolute bottom-left (0, height)
    path.quadraticBezierTo(0, size.height, 30, size.height);

    // 2. The middle span (Pulling the center down)
    // Control point is at the bottom-center
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width - 30,
      size.height,
    );

    // 3. The end of the bulge (Right Corner)
    // Control point is at the absolute bottom-right (width, height)
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - 20,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant oldClipper) {
    return true;
  }
}
