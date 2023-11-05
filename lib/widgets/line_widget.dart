import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: CustomPaint(
        painter: LinePainter(),
        size: const Size(300, 300),
      ),
    );
  }
}

class LinePainter extends CustomPainter {

  var mPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..color = Colors.green
    ..invertColors = false;

  @override
  void paint(Canvas canvas, Size size) {
    Offset p1 = const Offset(0, 100);
    Offset p2 = const Offset(200, 100);
    canvas.drawLine(p1, p2, mPaint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}