/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 15:37:32
 * @LastEditTime: 2020-11-02 16:13:38
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class RegisterSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二步-验证码'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text('输入验证码完成注册'),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
                child: Text('下一步'),
                onPressed: () {
                  Navigator.pushNamed(context, '/registerThird');
                  // pushReplacementNamed用第二步注册的页面替换当前页面
                  // Navigator.of(context).pushReplacementNamed('/registerThird');
                })
          ],
        ),
      ),
    );
  }
}
