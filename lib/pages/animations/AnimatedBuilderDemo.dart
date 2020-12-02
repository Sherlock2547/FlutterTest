/*
 * @Author: William-Zhou
 * @Date: 2020-11-19 17:18:57
 * @LastEditTime: 2020-11-19 17:22:06
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

/*
显示动画组件和隐式动画组件中各有一个万能的组件，
它们是 AnimatedBuilder 和 TweenAnimationBuilder，
当系统中不存在我们想要的动画组件时，可以使用这两个组件，
以 AnimatedBuilder 为例，实现 Container 大小和颜色同时动画，
*/
class AnimatedBuilderDemo extends StatefulWidget {
  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<Size> _sizeAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
    _sizeAnimation =
        SizeTween(begin: Size(100.0, 50.0), end: Size(200.0, 100.0))
            .animate(_controller);

    _controller.forward();
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
        appBar: AppBar(
          title: Text('自定义Animated'),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, widget) {
              return Container(
                width: _sizeAnimation.value.width,
                height: _sizeAnimation.value.height,
                color: _colorAnimation.value,
              );
            },
          ),
        ));
  }
}
