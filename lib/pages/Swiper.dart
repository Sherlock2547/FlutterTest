/*
 * @Author: William-Zhou
 * @Date: 2020-11-04 21:59:07
 * @LastEditTime: 2020-11-04 22:25:36
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
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
          title: Text('轮播图页面'),
        ),
        body: Column(
          children: <Widget>[
            Container(
                //适配参数
                // width: double.infinity,
                child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    imgList[index]['url'],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: imgList.length,
                //自动轮播
                autoplay: true,
                loop: true,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
            )),
            Row(
              children: [Text('1111')],
            )
          ],
        ));
  }
}
