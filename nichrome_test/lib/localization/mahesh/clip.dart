import 'package:flutter/material.dart';

class CustomEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0, size.height);

    final first = Offset(0, size.height - 20);
    final last = Offset(30, size.height - 20);
    path.quadraticBezierTo(first.dx, first.dy, last.dx, last.dy);

    final second = Offset(0, size.height - 20);
    final secondLast = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(second.dx, second.dy, secondLast.dx, secondLast.dy);

    final third = Offset(size.width, size.height - 20);
    final thirdLast = Offset(size.width, size.height);
    path.quadraticBezierTo(third.dx, third.dy, thirdLast.dx, thirdLast.dy);


    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}