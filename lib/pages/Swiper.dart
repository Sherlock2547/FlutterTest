/*
 * @Author: William-Zhou
 * @Date: 2020-11-04 21:59:07
 * @LastEditTime: 2020-11-15 14:12:21
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> with TickerProviderStateMixin {
  //动画需要这个类来混合
  //动画变量,以及初始化和销毁
  AnimationController _ctrlAnimationCircle;

  @override
  void initState() {
    super.initState();
    _ctrlAnimationCircle = AnimationController(
        //初始化动画变量
        lowerBound: 0,
        upperBound: 100,
        duration: Duration(milliseconds: 300),
        vsync: this);
    _ctrlAnimationCircle.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _ctrlAnimationCircle.dispose(); //销毁变量,释放资源
    super.dispose();
  }

  //生成Flow的数据
  List<Widget> _buildFlowChildren() {
    return List.generate(
        5,
        (index) => Container(
              child: Icon(
                index.isEven ? Icons.timer : Icons.ac_unit,
                color: Colors.primaries[index % Colors.primaries.length],
                size: 40,
              ),
            ));
  }

  List<Map> imgList = [
    {'url': 'https://www.itying.com/images/flutter/4.png'},
    {'url': 'https://www.itying.com/images/flutter/5.png'},
    {'url': 'https://www.itying.com/images/flutter/6.png'},
    {'url': 'https://www.itying.com/images/flutter/7.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('半圆菜单Zhankai',
              style: TextStyle(
                fontFamily: 'Xiaotu',
              )),
        ),
        body: Stack(
          children: <Widget>[
            // Container(
            //     //适配参数
            //     // width: double.infinity,
            //     child: AspectRatio(
            //   aspectRatio: 16 / 9,
            //   child: Swiper(
            //     itemBuilder: (BuildContext context, int index) {
            //       return new Image.network(
            //         imgList[index]['url'],
            //         fit: BoxFit.fill,
            //       );
            //     },
            //     itemCount: imgList.length,
            //     //自动轮播
            //     autoplay: true,
            //     loop: true,
            //     pagination: new SwiperPagination(),
            //     control: new SwiperControl(),
            //   ),
            // )),
            Positioned.fill(
              child: Flow(
                delegate: FlowAnimatedCircle(_ctrlAnimationCircle.value),
                children: _buildFlowChildren(),
              ),
            ),
            Positioned.fill(
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    //点击后让动画可前行或回退
                    _ctrlAnimationCircle.status == AnimationStatus.completed
                        ? _ctrlAnimationCircle.reverse()
                        : _ctrlAnimationCircle.forward();
                  });
                },
              ),
            ),
          ],
        ));
  }
}

class FlowAnimatedCircle extends FlowDelegate {
  final double radius; //绑定半径,让圆动起来
  FlowAnimatedCircle(this.radius);

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius == 0) {
      return;
    }
    double x = 0; //开始(0,0)在父组件的中心
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1)); //根据数学得出坐标
      y = radius * sin(i * pi / (context.childCount - 1)); //根据数学得出坐标
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    } //使用Matrix定位每个子组件
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => true;
}
