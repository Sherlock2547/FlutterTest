/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:45:24
 * @LastEditTime: 2020-11-05 23:22:49
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _news = '';
  @override
  void initState() {
    super.initState();
    // Map userInfo = {
    //   'userName': 'William',
    //   'age': 21,
    // };
    // print(json.encode(userInfo)); // Map=>Json

    // String userInfo2 = "{'userName': 'William','age': 21,}";
    // Map u = json.decode(userInfo2);
    // print(u['userName']);  // Json=>Map
  }

  //请求数据
  _getData() async {
    var apiUrl = 'https://www.googleapis.com/books/v1/volumes?q={http}';
    var result = await http.get(apiUrl);
    if (result.statusCode == 200) {
      var jsonResponse = json.decode(result.body);
      var itemCount = jsonResponse['totalItems'];
      setState(() {
        this._news = itemCount;
      });

      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${result.statusCode}.');
    }
  }

  //提交数据
  _postData() async {
    var apiUrl = 'https://www.googleapis.com/books/v1/volumes?q={http}';
    var result = await http.post(apiUrl, body: {
      'userName': 'William',
      'age': 21,
    });
    if (result.statusCode == 200) {
      var jsonResponse = json.decode(result.body);
      // var itemCount = jsonResponse['totalItems'];
      // setState(() {
      //   this._news = itemCount;
      // });

      print(jsonResponse);
    } else {
      print('Request failed with status: ${result.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this._news),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              child: Text('跳转到登录页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/fromDemo');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('跳转到注册页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/registerFirst');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Get请求数据'),
              onPressed: _getData,
              color: Colors.blue,
              textTheme: ButtonTextTheme.primary,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Post提交数据'),
              onPressed: _postData,
              color: Colors.red,
              textTheme: ButtonTextTheme.primary,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Get请求数据后渲染'),
              onPressed: () {
                Navigator.pushNamed(context, '/httpDemo');
              },
              color: Colors.purple,
              textTheme: ButtonTextTheme.primary,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Dio请求数据后渲染'),
              onPressed: () {
                Navigator.pushNamed(context, '/dioDemo');
              },
              color: Colors.blueAccent,
              textTheme: ButtonTextTheme.primary,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        )
      ],
    );
  }
}
