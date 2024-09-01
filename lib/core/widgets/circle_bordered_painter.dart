
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'dart:math';

import '../../config/styles/styles.dart';


class CircleBorderedClipper extends CustomClipper<Path>{
  final double radius;
  final List<Point<double>> controlPoints;
  CircleBorderedClipper({super.reclip, required this.radius , required this.controlPoints});

  @override
  Path getClip(Size size) {
    Path path = Path();

    for(int i = 0; i < controlPoints.length; i++){
      int lastIndex = i == 0 ? controlPoints.length - 1 : i - 1;
      int nextIndex = i == controlPoints.length - 1 ? 0 : i + 1;

      Vector2 v =
      Vector2(controlPoints[i].x, controlPoints[i].y)..multiply(
          Vector2(size.width, size.height));


      Vector2 a =
      Vector2(controlPoints[i].x - controlPoints[lastIndex].x,
          controlPoints[i].y - controlPoints[lastIndex].y)
        ..multiply(
            Vector2(size.width, size.height));

      Vector2 b =
      Vector2(controlPoints[i].x - controlPoints[nextIndex].x,
          controlPoints[i].y - controlPoints[nextIndex].y)
        ..multiply(
            Vector2(size.width, size.height));


      final shortestLength = (a - b).length;
      double maxRadius = radius.clamp(0, shortestLength  / 2);


      final halfang = acos(
          dot2(a.normalized(), b.normalized()))/2;



      Vector2 A = v - a.normalized().scaled(maxRadius/tan(halfang));

      Vector2 B = v - b.normalized().scaled(maxRadius/tan(halfang));


      final clockwise = !isLeft(controlPoints[lastIndex], controlPoints[nextIndex], controlPoints[i]);

      if(i == 0) {
        path.moveTo(A.x, A.y);
      } else {
        path.lineTo(A.x, A.y);
      }
      path.arcToPoint(Offset(B.x, B.y) , radius: Radius.circular(maxRadius), clockwise: clockwise );
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => true;

}
class CircleBorderedPainter extends CustomPainter {
  final double radius;
  final Color color;
  final List<Point<double>> controlPoints;
  CircleBorderedPainter({super.repaint, required this.radius , required this.controlPoints, this.color= bgColor});

  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();

    for(int i = 0; i < controlPoints.length; i++){
      int lastIndex = i == 0 ? controlPoints.length - 1 : i - 1;
      int nextIndex = i == controlPoints.length - 1 ? 0 : i + 1;

      if(isColinear(controlPoints[lastIndex], controlPoints[nextIndex], controlPoints[i])){
        path.lineTo(controlPoints[i].x * size.width, controlPoints[i].y * size.height);
        continue;
      }
      Vector2 v =
      Vector2(controlPoints[i].x, controlPoints[i].y)..multiply(
          Vector2(size.width, size.height));


      Vector2 a =
      Vector2(controlPoints[i].x - controlPoints[lastIndex].x,
          controlPoints[i].y - controlPoints[lastIndex].y)
        ..multiply(
            Vector2(size.width, size.height));

      Vector2 b =
      Vector2(controlPoints[i].x - controlPoints[nextIndex].x,
          controlPoints[i].y - controlPoints[nextIndex].y)
        ..multiply(
            Vector2(size.width, size.height));



      final shortestLength = (a - b).length;
      double maxRadius = radius.clamp(0, shortestLength  / 2);


      final halfang = acos(
          dot2(a.normalized(), b.normalized()))/2;

      Vector2 A = v - a.normalized().scaled(maxRadius/tan(halfang));

      Vector2 B = v - b.normalized().scaled(maxRadius/tan(halfang));
      final clockwise = !isLeft(controlPoints[lastIndex], controlPoints[nextIndex], controlPoints[i]);

      if(i == 0) {
        path.moveTo(A.x, A.y);
      } else {
        path.lineTo(A.x, A.y);
      }
      path.arcToPoint(Offset(B.x, B.y) , radius: Radius.circular(maxRadius), clockwise: clockwise );
    }
    Paint paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}


bool isColinear(Point a, Point b, Point c) => (b.x - a.x)*(c.y - a.y) - (b.y - a.y)*(c.x - a.x) == 0;

bool isLeft(Point a, Point b, Point c) => (b.x - a.x)*(c.y - a.y) - (b.y - a.y)*(c.x - a.x) > 0;
