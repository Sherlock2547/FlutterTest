/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-11-02 08:16:22
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
    return Container(
      height: 800,
      width: 400,
      color: Colors.pink,
      child: Wrap(
        spacing: 10,
        runSpacing: 15,
        // direction: Axis.vertical,//纵向显示
        runAlignment: WrapAlignment.center,
        // alignment: WrapAlignment.spaceEvenly,
        children: <Widget>[
          MyButton('第1集'),
          MyButton('第2集'),
          MyButton('第3集'),
          MyButton('第4集'),
          MyButton('第5集'),
          MyButton('第6集'),
          MyButton('第7集'),
          MyButton('第8集'),
          MyButton('第9集'),
          MyButton('第10集'),
          MyButton('第11集'),
          MyButton('第12集'),
          MyButton('第13集'),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  const MyButton(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      // textColor: Theme.of(context).accentColor,
      textColor: Colors.blue,
      onPressed: () {},
    );
  }
}
