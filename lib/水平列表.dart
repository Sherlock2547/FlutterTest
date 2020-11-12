/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-10-31 10:59:59
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
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal, //水平列表
        children: <Widget>[
          Container(
            width: 180.0,
            color: Colors.red,
          ),
          Container(
            width: 180.0,
            color: Colors.orange,
            child: ListView(
              children: <Widget>[
                Image.network(
                    'https://ae01.alicdn.com/kf/Ud12a41b2bdbb49dcb544f6c1c923def2i.jpg'),
                Text('文本123')
              ],
            ),
          ),
          Container(
            width: 180.0,
            color: Colors.yellow,
          ),
          Container(
            width: 180.0,
            color: Colors.green,
          ),
          Container(
            width: 180.0,
            color: Colors.blue,
          ),
          Container(
            width: 180.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
