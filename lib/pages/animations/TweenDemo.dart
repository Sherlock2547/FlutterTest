/*
 * @Author: William-Zhou
 * @Date: 2020-11-19 09:41:16
 * @LastEditTime: 2020-11-19 09:50:10
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Color _startColor = Colors.blue;
  Color _endColor = Colors.red;

  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {
              _color = Color.lerp(_startColor, _endColor, _controller.value);
            });
          });
  }

  //? 方法2
  /*
     AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画2'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              _controller.forward();
            },
            child: Container(
              height: 100,
              width: 100,
              color: _color,
              alignment: Alignment.center,
              child: Text(
                '点我变色',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
