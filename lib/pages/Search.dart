/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 13:51:24
 * @LastEditTime: 2020-11-23 14:18:48
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  // const SearchPage({Key key}) : super(key: key);
  final arguments;
  SearchPage({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('搜索页'),
        ),
        // body: Text('666${arguments != null ? arguments['id'] : '0'}'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text('测试${arguments['id'] ??= '0'}'),
            RaisedButton(
              child: Text('${arguments != null ? arguments['id'] : '0'}'),
              onPressed: () {
                Navigator.of(context).pop('从搜索页面返回');
              },
            )
          ],
        ));
  }
}
