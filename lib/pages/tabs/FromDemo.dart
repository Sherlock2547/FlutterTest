/*
 * @Author: William-Zhou
 * @Date: 2020-11-03 16:13:35
 * @LastEditTime: 2020-11-04 09:48:04
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  var _userName;
  var _password;
  var sex = 1;
  String info = '';
  List hobby = [
    {'checked': true, 'title': '吃饭'},
    {'checked': false, 'title': '睡觉'},
    {'checked': true, 'title': '写代码'},
  ];

  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < this.hobby.length; i++) {
      tempList.add(Row(
        children: <Widget>[
          Text(this.hobby[i]['title'] + ':'),
          Checkbox(
              value: this.hobby[i]['checked'],
              onChanged: (value) {
                setState(() {
                  this.hobby[i]['checked'] = value;
                });
              })
        ],
      ));
    }
    return tempList;
  }

  void _sexChanged(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('登录页'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (value) {
                setState(() {
                  this._userName = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  this._password = value;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.paste_sharp),
                  labelText: '密码',
                  hintText: '请输入密码',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('男：'),
                Radio(value: 1, groupValue: this.sex, onChanged: _sexChanged),
                SizedBox(
                  width: 20,
                ),
                Text('女：'),
                Radio(value: 2, groupValue: this.sex, onChanged: _sexChanged),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //爱好
            Column(
              children: this._getHobby(),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: '输入描述信息',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                setState(() {
                  this.info = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              height: 50,
              width: 170,
              child: RaisedButton(
                onPressed: () {
                  print(new DateTime.now());
                  print('用户名：' + this._userName);
                  print('密码：' + this._password);
                  print('性别：${this.sex == 1 ? '男' : '女'}');
                  print('爱好：${this.hobby}');
                  print('描述：${this.info}');
                },
                child: Text('登录'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
