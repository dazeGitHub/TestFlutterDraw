import 'package:flutter/material.dart';

class PathWidget extends StatelessWidget {
  const PathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent,
        child: CustomPaint(
          painter: PathPainter(),
          size: const Size(300, 300),
        )
    );
  }
}

class PathPainter extends CustomPainter {

  var mPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..color = Colors.blue
    ..invertColors = false;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(30, 30);
    path.lineTo(300, 200);
    path.lineTo(150, 200);
    path.lineTo(100, 250);
    path.close();
    canvas.drawPath(path, mPaint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}