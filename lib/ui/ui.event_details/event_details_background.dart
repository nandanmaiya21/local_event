import 'package:flutter/material.dart';
import 'package:local_event/model/event.dart';
import 'package:provider/provider.dart';

class EventDetailBackground extends StatelessWidget {
  const EventDetailBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final event = Provider.of<Event>(context);
    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: ImageClipper(),
        child: Image.asset(
          event.imagePath,
          width: screenWidth,
          color: Color(0x99000000),
          colorBlendMode: BlendMode.darken,
          height: screenHeight * 0.5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.85,
        curveEndPoint.dx - 60, curveEndPoint.dy + 10);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.99,
        curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
