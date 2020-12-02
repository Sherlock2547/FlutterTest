/*
 * @Author: William-Zhou
 * @Date: 2020-11-23 09:27:28
 * @LastEditTime: 2020-11-23 09:29:13
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

///
/// des:
///
class CircleProgress extends StatefulWidget {
  @override
  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircleProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: _CircleProgressPaint(.5),
          ),
        ),
      ),
    );
  }
}

class _CircleProgressPaint extends CustomPainter {
  final double progress;

  _CircleProgressPaint(this.progress);

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

  @override
  void paint(Canvas canvas, Size size) {
    _paint.shader = ui.Gradient.sweep(
        Offset(size.width / 2, size.height / 2), [Colors.red, Colors.yellow]);
    canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height), 0, pi * 2, false, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
