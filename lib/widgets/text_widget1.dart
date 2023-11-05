import 'dart:ui' as ui;
import 'package:flutter/material.dart';

//使用 Paragraph 实现文字绘制
class TextWidget1 extends StatelessWidget {
  const TextWidget1({super.key});

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
  ui.Paragraph? mParagraph;

  var mRectPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..color = Colors.blue
    ..invertColors = false;

  final mParagraphStyle = ui.ParagraphStyle(
    // 字体方向, 有些国家语言是从右往左排版的
      textDirection: TextDirection.ltr,
      // 字体对齐方式
      textAlign: TextAlign.left,
      fontSize: 14,
      maxLines: 2,
      // 字体超出大小时显示的提示
      ellipsis: '...',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      height: 5,
      // 当我们设置[TextStyle.height]时 这个高度是否应用到字体顶部和底部
      textHeightBehavior:
      const TextHeightBehavior(applyHeightToFirstAscent: true, applyHeightToLastDescent: true)
  );

  var mStartOffset = 0.0; //50

  @override
  void paint(Canvas canvas, Size size) {
    buildParagraph();
    if(mParagraph != null){
      // 画一个辅助矩形（可以通过paragraph.width和paragraph.height来获取绘制文字的宽高）
      canvas.drawRect(
          Rect.fromLTRB(mStartOffset, mStartOffset, mStartOffset + mParagraph!.width, mStartOffset + mParagraph!.height),
          mRectPaint
      );
      canvas.drawParagraph(mParagraph!, Offset(mStartOffset, mStartOffset - 40));//这里不减去 40 文字就不会在左上角, 不知为何 ?
    }
  }

  void buildParagraph(){
    if(mParagraph == null){
      final paragraphBuilder = ui.ParagraphBuilder(mParagraphStyle);
      paragraphBuilder.addText('使用 Paragraph 绘制文字');
      mParagraph = paragraphBuilder.build();
      mParagraph?.layout(const ui.ParagraphConstraints(width: 200));
    }
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}