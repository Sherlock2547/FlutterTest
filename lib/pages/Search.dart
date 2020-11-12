/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 13:51:24
 * @LastEditTime: 2020-11-02 15:06:57
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
        title: Text('搜索页面'),
      ),
      body: Text('666${arguments != null ? arguments['id'] : '0'}'),
    );
  }
}
