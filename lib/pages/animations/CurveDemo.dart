/*
 * @Author: William-Zhou
 * @Date: 2020-11-19 09:53:38
 * @LastEditTime: 2020-11-19 16:29:38
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

//!使动画的效果能够以匀速、加速、减速、抛物线等各种速率变化。
class CurveDemo extends StatefulWidget {
  @override
  _CurveDemoState createState() => _CurveDemoState();
}

class _CurveDemoState extends State<CurveDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 6000))
          ..addListener(() {
            setState(() {});
          });
    //? 蓝色盒子大小 100 变大到 200，动画曲线设置为 bounceIn（弹簧效果）
    // _animation = Tween(begin: 100.0, end: 200.0)
    //     .chain(CurveTween(curve: Curves.elasticIn))
    //     .animate(_controller);

    //? 使用自定义曲线
    // _animation = Tween(begin: 100.0, end: 250.0)
    //     .chain(CurveTween(curve: _StairsCurve(10)))
    //     .animate(_controller);

    //序列
    //?动画时长为 6 秒，前 40% 的时间大小从 100->200，然后保持 200 不变 20% 的时间，最后 40% 的时间大小从 200->300
    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 100.0, end: 200.0)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 40),
      TweenSequenceItem(tween: ConstantTween<double>(200.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 40),
    ]).animate(_controller);
  }
/* 错误写法
动画加上 Curve 后，AnimationController 的最小 / 大值必须是 [0,1] 之间，100>1
_controller =
    AnimationController(vsync: this, 
    duration: Duration(milliseconds: 1000),
    lowerBound: 100.0,upperBound: 200.0)
      ..addListener(() {
        setState(() {});
      });
_animation = CurveTween(curve: Curves.bounceIn).animate(_controller);
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
              height: _animation.value,
              width: _animation.value,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://ae01.alicdn.com/kf/U1d9e27cbda65498bbc365ff81328bb92d.jpg'),
                  fit: BoxFit.cover,
                ),
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

//?自定义楼梯效果动画曲线需要继承 Curve 重写 transformInternal 方法即可
class _StairsCurve extends Curve {
  //阶梯的数量
  final int num;
  double _perStairY;
  double _perStairX;

  _StairsCurve(this.num) {
    _perStairY = 1.0 / (num - 1);
    _perStairX = 1.0 / num;
  }

  @override
  double transformInternal(double t) {
    return _perStairY * (t / _perStairX).floor();
  }
}
