import 'package:flutter/material.dart';

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClipPathPainter(),
      size: const Size(500, 500),
      child: const Text('绘制裁剪路径'),
    );
  }
}


class ClipPathPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // 裁剪的形状、路径
    Path path = Path();
    path.lineTo(-100, -100);
    path.lineTo(-100, 200);
    path.close();
    canvas.clipPath(path);
    // 裁剪前的原图形
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawCircle(size.center(Offset.zero), 120, paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}