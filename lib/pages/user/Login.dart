/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 15:37:32
 * @LastEditTime: 2020-11-03 16:13:16
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('登录页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text('这里是登录界面'),
            RaisedButton(
                child: Text('立即登录'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
