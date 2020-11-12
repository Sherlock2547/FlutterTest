/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-10-30 14:40:33
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Williams Flutter Demo'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(
        '你好呀flutter123',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis, //省略号
        maxLines: 1,
        // textScaleFactor: 2, //放大至2倍
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 40.0,
            color: Colors.green,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dotted,
            letterSpacing: 5.0),
      ),
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      // padding: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(10, 30, 5, 0),
      // margin: EdgeInsets.fromLTRB(10, 30, 5, 0),
      // transform: Matrix4.translationValues(0, 100, 0),
      alignment: Alignment.bottomCenter,
    ));
  }
}
