/*
 * @Author: William-Zhou
 * @Date: 2020-11-05 14:29:59
 * @LastEditTime: 2020-11-05 23:24:16
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list = [];
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  _getData() async {
    var apiUrl = 'http://a.itying.com/api/productlist';
    var result = await http.get(apiUrl);

    if (result.statusCode == 200) {
      print(result.body);
      setState(() {
        this._list = json.decode(result.body)['result'];
      });
    } else {
      print('失败${result.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请求数据Demo'),
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
