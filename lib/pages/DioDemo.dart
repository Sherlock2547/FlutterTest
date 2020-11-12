/*
 * @Author: William-Zhou
 * @Date: 2020-11-05 22:17:47
 * @LastEditTime: 2020-11-05 23:20:00
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioDemoPage extends StatefulWidget {
  @override
  _DioDemoPageState createState() => _DioDemoPageState();
}

class _DioDemoPageState extends State<DioDemoPage> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  _getData() async {
    var apiUrl =
        'http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1';
    Response result = await Dio().get(apiUrl);
    // print(json.decode(result.data)['result']);
    setState(() {
      this._list = json.decode(result.data)['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio请求数据Demo'),
        centerTitle: true,
      ),
      body: this._list.length > 0
          ? ListView.builder(
              itemCount: this._list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${this._list[index]['title']}'),
                );
              })
          : Text('加载中...'),
    );
  }
}
