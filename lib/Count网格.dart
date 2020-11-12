/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-11-01 11:44:06
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
  List<Widget> _getListData() {
    var tempList = listData.map((e) {
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(
              e['imageUrl'],
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              e['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2, //一行的wedget数量
        crossAxisSpacing: 10, //水平子Widget之间间距
        mainAxisSpacing: 30, //垂直子Widget之间间距
        padding: EdgeInsets.all(15),
        childAspectRatio: 0.6, //调整宽高比
        children: this._getListData());
  }
}
