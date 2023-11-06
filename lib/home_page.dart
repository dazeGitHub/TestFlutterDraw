import 'package:flutter/material.dart';
import 'package:test_flutter_draw/widgets/circle_widget.dart';
import 'package:test_flutter_draw/widgets/image_widget.dart';
import 'package:test_flutter_draw/widgets/line_widget.dart';
import 'package:test_flutter_draw/widgets/oval_widget.dart';
import 'package:test_flutter_draw/widgets/path_widget.dart';
import 'package:test_flutter_draw/widgets/rect_widget.dart';
import 'package:test_flutter_draw/widgets/round_rect_widget.dart';
import 'package:test_flutter_draw/widgets/text_widget1.dart';
import 'package:test_flutter_draw/widgets/text_widget2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("绘制图片"),
      ),
      body: const ImageWidget(),
      //LineWidget()  RectWidget()  CircleWidget()  OvalWidget()  RoundRectWidget()  PathWidget()
      //PathWidget()  TextWidget1()  TextWidget2()  ImageWidget
    );
  }
}