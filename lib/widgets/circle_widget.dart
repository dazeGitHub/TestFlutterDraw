import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: CustomPaint(
        painter: CirclePainter(),
        size: const Size(300, 300),
      ),
    );
  }
}


class CirclePainter extends CustomPainter {

  var mPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..color = Colors.blue
    ..invertColors = false;

  @override
  void paint(Canvas canvas, Size size) {
    //size.center(Offset.zero) 表示取 size 的中心做为原点
    canvas.drawCircle(size.center(Offset.zero), 120, mPaint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}