import 'package:flutter/material.dart';

class HomePageBackGround extends StatelessWidget {
  final screenHeight;
  const HomePageBackGround({
    super.key,
    required this.screenHeight,
  });
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomShapClipper(),
      child: Container(
        height: screenHeight * 0.5,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class BottomShapClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
