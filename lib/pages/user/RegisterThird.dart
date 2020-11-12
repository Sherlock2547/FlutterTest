/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 15:37:32
 * @LastEditTime: 2020-11-02 16:24:31
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import '../tabs/Tabs.dart';

class RegisterThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三步-完成注册'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text('输入密码完成注册'),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
                child: Text('确定'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  //返回根
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (context) => new Tabs(
                                index: 1,
                              )),
                      (route) => route == null);
                })
          ],
        ),
      ),
    );
  }
}
