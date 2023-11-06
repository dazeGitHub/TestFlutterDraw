import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return ImageState();
  }
}

class ImageState extends State<ImageWidget> {
  ui.Image? mImage;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: CustomPaint(
        painter: ImagePainter(mImage),
        size: const Size(300, 300),
      ),
    );
  }

  Future<void> loadImage() async {
    ui.Image image = await load('assets/images/splash.jpg');
    setState(() {
      mImage = image;
    });
  }

  Future<ui.Image> load(String assetImg) async {
    ByteData data = await rootBundle.load(assetImg);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),targetWidth: 200,targetHeight: 200);
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}

class ImagePainter extends CustomPainter {
  ImagePainter(this.mImage);

  ui.Image? mImage;

  var mStartOffset = 0.0; //50
  var mPaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..color = Colors.green
    ..invertColors = false;

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制原图
    if(mImage != null){
      canvas.drawImage(mImage!, Offset(mStartOffset, mStartOffset), mPaint);
    }
  }

  //在实际场景中正确利用此回调可以避免重绘开销, 这里简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}