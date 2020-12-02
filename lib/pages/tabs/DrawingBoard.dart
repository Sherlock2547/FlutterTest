/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 08:53:16
 * @LastEditTime: 2020-11-23 09:50:21
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterapp01/pages/animations/Rose.dart';

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  List<List<Offset>> _path = [];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent pointerDownEvent) {
        setState(() {
          _path.add([pointerDownEvent.localPosition]);
        });
      },
      onPointerMove: (PointerMoveEvent pointerMoveEvent) {
        setState(() {
          _path[_path.length - 1].add(pointerMoveEvent.localPosition);
        });
      },
      onPointerUp: (PointerUpEvent pointerUpEvent) {
        setState(() {
          _path[_path.length - 1].add(pointerUpEvent.localPosition);
        });
      },
      onPointerCancel: (PointerCancelEvent pointerCancelEvent) {
        setState(() {
          _path[_path.length - 1].add(pointerCancelEvent.localPosition);
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          child: Rose(),
          // GridView.count(
          //   physics: BouncingScrollPhysics(),
          //   crossAxisCount: 3,
          //   crossAxisSpacing: 12,
          //   mainAxisSpacing: 14,
          //   children: List.generate(3, (i) {
          //     return Draggable(
          //       child: Container(
          //         alignment: Alignment.center,
          //         height: 120,
          //         width: 120,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.primaries[i % Colors.primaries.length + 6],
          //         ),
          //         child: Text(
          //           '$i',
          //           style: TextStyle(
          //               fontFamily: 'Xiaotu',
          //               fontSize: 24,
          //               color: Colors.white),
          //         ),
          //       ),
          //       feedback: Container(
          //         height: 120,
          //         width: 120,
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.primaries[i % Colors.primaries.length],
          //         ),
          //         child: Text(
          //           '$i',
          //           style: TextStyle(
          //               fontFamily: 'Xiaotu',
          //               fontSize: 24,
          //               color: Colors.white),
          //         ),
          //       ),
          //     );
          //   }),
          // ),
          painter: DrawingBoardPainter(_path),
        ),
      ),
    );
  }
}

class DrawingBoardPainter extends CustomPainter {
  final List<List<Offset>> path;

  DrawingBoardPainter(this.path);

  Paint _paint = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    path.forEach((list) {
      Path _path = Path();
      for (int i = 0; i < list.length; i++) {
        if (i == 0) {
          _path.moveTo(list[i].dx, list[i].dy);
        } else {
          _path.lineTo(list[i].dx, list[i].dy);
        }
      }
      canvas.drawPath(_path, _paint);
    });
  }

  @override
  bool shouldRepaint(DrawingBoardPainter oldDelegate) {
    return true;
  }
}
