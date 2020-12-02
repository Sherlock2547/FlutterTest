/*
 * @Author: William-Zhou
 * @Date: 2020-11-18 16:29:56
 * @LastEditTime: 2020-11-19 09:39:20
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class AnimationBaseDemo extends StatefulWidget {
  @override
  _AnimationBaseDemoState createState() => _AnimationBaseDemoState();
}

class _AnimationBaseDemoState extends State<AnimationBaseDemo>
    with SingleTickerProviderStateMixin {
  double _size = 100;
  AnimationController _controller;

  ///当创建 AnimationController 时，需要传递一个 vsync 参数，
  ///存在 vsync 时会防止屏幕外动画消耗不必要的资源，
  ///单个 AnimationController 的时候使用 SingleTickerProviderStateMixin，
  ///多个 AnimationController 使用 TickerProviderStateMixin。
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500),
        lowerBound: 100,
        upperBound: 250)
      ..addStatusListener((AnimationStatus status) {
        // if (status == AnimationStatus.completed) {
        //   _controller.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   _controller.forward();
        // }
      })
      ..addListener(() {
        setState(() {
          _size = _controller.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画1'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.repeat(reverse: false);
          },
          child: Container(
            height: _size,
            width: _size,
            alignment: Alignment.center,
            // child: Text(
            //   '点我变大',
            //   style: TextStyle(color: Colors.white, fontSize: 18),
            // ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                    'https://ae01.alicdn.com/kf/U90d8122435a64a7c8acc9a33a765ea27m.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
