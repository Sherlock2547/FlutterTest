/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 11:10:23
 * @LastEditTime: 2020-11-16 11:20:47
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var imgList = [
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkp4357o3hj31mc1aw43t.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkp41vaa3yj33g02aowz7.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkdk5uy3y9j30jg0caaav.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkp43ude6dj31hc0u0dj0.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprb9ermuj31tm14ugnx.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprd2luw4j33vc2kwql8.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkpre3r96kj32151bgtde.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkpreoneukj34g02yohdt.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkproo21u3j30p00dwq3b.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprqtpah0j32io1k64bg.jpg',
    'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprrad2yoj335r2dhke8.jpg',
  ];
  PageController _pageController;

  var _currPageValue = 0.0;

  //缩放系数
  double _scaleFactor = .8;

  //view page height
  double _height = 230.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: _height,
            child: PageView.builder(
              itemBuilder: (context, index) => _buildPageItem(index),
              itemCount: 10,
              controller: _pageController,
            )),
      ],
    ));
  }

  _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      //当前的item
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() + 1) {
      //右边的item
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() - 1) {
      //左边
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
    }

    return Transform(
      transform: matrix4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(imgList[index % imgList.length]),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
