/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-10-30 16:17:05
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
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Image.network(
            'https://ae01.alicdn.com/kf/Uc198ba7b3a674fb2b55d2ee6d93c0aaad.jpg'),
        Container(
          child: Text(
            '标题111',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.green),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            'https://ae01.alicdn.com/kf/U1874bafc88614c83a289834fa8c42354b.jpg'),
        Container(
          child: Text(
            '标题111',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.red),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            'https://ae01.alicdn.com/kf/U8d1e2d69744d49e3bc1042e13d9d9633S.png'),
        Container(
          child: Text(
            '标题111',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.yellow),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network(
            'https://ae01.alicdn.com/kf/Ud12a41b2bdbb49dcb544f6c1c923def2i.jpg'),
        Container(
          child: Text(
            '标题111',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
      ],
    );
  }
}
