import 'package:flutter/material.dart';

class RectWidget extends StatelessWidget {
  const RectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: CustomPaint(
        painter: RectPainter(),
        size: const Size(300, 300),
      )
    );
  }
}

class RectPainter extends CustomPainter {

  var mPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..color = Colors.red
    ..invertColors = false;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(const Offset(100, 100), const Offset(200, 200));
    canvas.drawRect(rect, mPaint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}