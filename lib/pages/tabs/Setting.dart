/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:45:24
 * @LastEditTime: 2020-11-18 14:09:56
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../pages/ScaleDemo.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              '迪丽热巴',
              style: TextStyle(
                  fontFamily: 'Xiaotu', fontSize: 24, color: Colors.blue),
            ),
            SizedBox(
              height: 20,
            ),
            InteractiveViewer(
              alignPanAxis: true,
              maxScale: 3,
              minScale: 1,
              // constrained: false,
              // scaleEnabled: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  width: 250,
                  child: Image.network(
                    'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text('SnackBar消息提示'),
              color: Colors.green,
              textColor: Colors.white,
              elevation: 20,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(
                  //? 默认底部弹出悬浮
                  // behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: '确定',
                    onPressed: () {
                      print('确定');
                    },
                    textColor: Colors.purple,
                  ),
                  content: Text(
                    '你最可爱，我说时来不及思索，但思索过后，还是这样说',
                    style: TextStyle(fontFamily: 'Suxin', color: Colors.white),
                  ),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.blue,
                  elevation: 20,
                ));
              },
            )

            // SizedBox(
            //   height: 30,
            // ),
            // RaisedButton(
            //   child: Text('跳转到登录页面'),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/fromDemo');
            //   },
            //   color: Theme.of(context).accentColor,
            //   textTheme: ButtonTextTheme.primary,
            // ),
          ],
        )
      ],
    );
  }
}
