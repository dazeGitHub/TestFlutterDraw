import 'dart:ui' as ui;
import 'package:flutter/material.dart';

//使用 TextPainter 而不是 Paragraph, TextPainter 是通过 Paragraph 封装而成的
class TextWidget2 extends StatelessWidget {
  const TextWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent,
        child: CustomPaint(
          painter: MyPainter(),
          size: const Size(300, 300),
        )
    );
  }
}

class MyPainter extends CustomPainter {
  ui.Paragraph? paragraph;

  var mRectPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..color = Colors.blue
    ..invertColors = false;

  var mTextPainter = TextPainter(
    text: const TextSpan(
        text: "使用 TextPainter 绘制文字",
        style: TextStyle(color: Colors.red, fontSize: 20)
    ),
    textDirection: TextDirection.rtl,
    textWidthBasis: TextWidthBasis.longestLine,
    maxLines: 2,
  )..layout(); // 可以传入 minWidth, maxWidth 来限制它的宽度, 如不传, 文字会绘制在一行

  var startOffset = 0.0;

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制辅助矩形框，在文字绘制前即可通过textPainter.width和textPainter.height来获取文字绘制的宽度
    canvas.drawRect(
        Rect.fromLTRB(startOffset, startOffset, startOffset + mTextPainter.width, startOffset + mTextPainter.height),
        mRectPaint
    );
    mTextPainter.paint(canvas, Offset(startOffset, startOffset));
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}