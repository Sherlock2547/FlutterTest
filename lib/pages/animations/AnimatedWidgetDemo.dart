/*
 * @Author: William-Zhou
 * @Date: 2020-11-19 16:58:39
 * @LastEditTime: 2020-11-19 17:00:47
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class AnimatedWidgetDemo extends StatefulWidget {
  @override
  _AnimatedWidgetDemoState createState() => _AnimatedWidgetDemoState();
}

//?我们并没有主动创建 AnimationController 和 Tween，
//?是因为 AnimatedOpacity 内部已经创建了
class _AnimatedWidgetDemoState extends State<AnimatedWidgetDemo> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 2),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _opacity = 0;
            });
          },
          child: Container(
            height: 60,
            width: 150,
            // color: Colors.blue,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                    'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
