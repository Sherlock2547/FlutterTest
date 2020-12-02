/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 15:37:32
 * @LastEditTime: 2020-11-13 10:31:46
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class RegisterFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一步-输入手机号'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text('这是注册的第一步，请输入手机号，然后点击下一步',
                style: TextStyle(
                  fontFamily: 'Banshu',
                )),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
                child: Text('下一步'),
                onPressed: () {
                  Navigator.pushNamed(context, '/registerSecond');
                  // pushReplacementNamed用第二步注册的页面替换当前页面
                  // Navigator.of(context).pushReplacementNamed('/registerSecond');
                })
          ],
        ),
      ),
    );
  }
}
