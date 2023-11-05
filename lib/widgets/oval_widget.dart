import 'package:flutter/material.dart';

class OvalWidget extends StatelessWidget {
  const OvalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: CustomPaint(
        painter: OvalPainter(),
        size: const Size(300, 300),
      ),
    );
  }
}

class OvalPainter extends CustomPainter {

  var mOvalPaint1 = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..color = Colors.green
    ..invertColors = false;

  var mCirclePaint2 = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..color = Colors.red
    ..invertColors = false;

  @override
  void paint(Canvas canvas, Size size) {
    // 宽高不相等为椭圆
    Rect rect = Rect.fromCenter(center: size.center(Offset.zero), width: 200, height: 100);
    canvas.drawOval(rect, mOvalPaint1);
    // 宽高相等为正圆
    Rect rect2 = Rect.fromCenter(center: size.center(Offset.zero), width: 50, height: 50);
    canvas.drawOval(rect2, mCirclePaint2);
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}