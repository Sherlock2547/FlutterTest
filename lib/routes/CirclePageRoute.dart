/*
 * @Author: William-Zhou
 * @Date: 2020-11-22 20:53:46
 * @LastEditTime: 2020-11-22 20:54:11
 * @LastEditors: William-Zhou
 * @Description: 
 */

import 'dart:math';

import 'package:flutter/material.dart';

class CirclePageRoute extends PageRoute {
  CirclePageRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper: CirclePath(animation.value),
          child: child,
        );
      },
      child: builder(context),
    );
  }
}

class CirclePath extends CustomClipper<Path> {
  CirclePath(this.value);

  final double value;

  @override
  Path getClip(Size size) {
    var path = Path();
//?半径的最大值并不是屏幕的宽或者高，而是屏幕的对角线长度
    double radius =
        value * sqrt(size.height * size.height + size.width * size.width);
//?只需将椭圆的矩形区域设置为正方形，那么裁切出来的就是圆形。
    path.addOval(Rect.fromLTRB(
        size.width - radius, -radius, size.width + radius, radius));
//?由于是从右上角开始，而且裁切的矩形区域必须是正方形，所以裁切的矩形区域是超出页面区域的。
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
