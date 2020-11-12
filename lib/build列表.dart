/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-10-31 19:49:14
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
  Widget _getListData(context, index) {
    return ListTile(
      leading: Image.network(listData[index]['imageUrl']),
      title: Text(listData[index]['title']),
      subtitle: Text(listData[index]['author']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length, itemBuilder: this._getListData);
  }
}
