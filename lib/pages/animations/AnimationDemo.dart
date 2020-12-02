/*
 * @Author: William-Zhou
 * @Date: 2020-11-19 11:07:13
 * @LastEditTime: 2020-11-19 17:04:14
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

//?先执行颜色变化，在执行大小变化
class AnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationDemo();
}

class _AnimationDemo extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorAnimation;
  Animation _sizeAnimation;
  double _opacity = 1.0;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this)
          ..addListener(() {
            setState(() {});
          });

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.0, 0.5)));

    _sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 1.0)));

    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画3'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: _sizeAnimation.value,
                width: _sizeAnimation.value,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius: BorderRadius.circular(15),
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg'),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _opacity = 0;
                    });
                  },
                  child: Container(
                    height: 150,
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
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
