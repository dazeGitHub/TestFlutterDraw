import 'package:flutter/material.dart';

class RoundRectWidget extends StatelessWidget {
  const RoundRectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent,
        child: CustomPaint(
          painter: RoundRectPainter(),
          size: const Size(300, 300),
        )
    );
  }
}

class RoundRectPainter extends CustomPainter {

  var mPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..color = Colors.green
    ..invertColors = false;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(const Offset(50, 100), const Offset(250, 150));
    RRect rRect = RRect.fromRectAndRadius(rect, const Radius.circular(30));
    canvas.drawRRect(rRect, mPaint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}