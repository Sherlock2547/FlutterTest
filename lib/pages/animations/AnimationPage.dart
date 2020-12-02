/*
 * @Author: William-Zhou
 * @Date: 2020-11-18 16:50:03
 * @LastEditTime: 2020-11-23 10:22:22
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimationPage'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('跳转到AnimationBaseDemo界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/animationBaseDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('跳转到tweenDemo界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/tweenDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('跳转到curveDemo界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/curveDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('跳转到multiControllerDemo界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/multiControllerDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('动画序列'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/animationDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('自定义Animated'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/animatedBuilderDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('列表动画'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/animatedListDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('Hero动画'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/heroDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('containerAnimationsDemo'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/containerAnimationsDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('shareAxisDemo'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/shareAxisDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('淡入模式'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/fadeThroughTransitionDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('淡入淡出模式'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/fadeScaleTransitionDemo');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('路由动画'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/navigationAnimation');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('customCircleProgress'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/customCircleProgress');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('rose'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/rose');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('日历翻页'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/flipAnimationDemo');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('3D旋转'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/transformDemo');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('翻书动画'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/flipUpDemo');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('涟漪动画'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/waterRipplePage');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  child: Text('雷达动画'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/radarPage');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
              ],
            ),
          ],
        ));
  }
}
