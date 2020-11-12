/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-11-01 22:21:19
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'res/listData.dart';

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
        height: 300,
        width: 300,
        color: Colors.red,
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 10,
              top: 10,
              child: Icon(
                Icons.hail,
                size: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Icon(
                Icons.search,
                size: 60,
                color: Colors.orange,
              ),
            ),
            Positioned(
              right: 10,
              child: Icon(
                Icons.send,
                size: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
