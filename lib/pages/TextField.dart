/*
 * @Author: William-Zhou
 * @Date: 2020-11-03 11:25:03
 * @LastEditTime: 2020-11-03 16:46:31
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class TextFieldDemoPage extends StatefulWidget {
  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  //初始化时给表单赋值可以用 TextEditingController
  var _userName = new TextEditingController();
  var _password;
  var sex = 1;
  bool flag = true;
  @override
  void initState() {
    super.initState();
    _userName.text = '初始值William';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('表单演示页面'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        // child: TextDemo(),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (value) {
                setState(() {
                  this._userName.text = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              // controller: _password,
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('男：'),
                Radio(
                    value: 1,
                    groupValue: this.sex,
                    onChanged: (v) {
                      setState(() {
                        this.sex = v;
                      });
                    }),
                SizedBox(
                  width: 20,
                ),
                Text('女：'),
                Radio(
                    value: 2,
                    groupValue: this.sex,
                    onChanged: (v) {
                      setState(() {
                        this.sex = v;
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RadioListTile(
              value: 1,
              groupValue: this.sex,
              onChanged: (v) {
                setState(() {
                  this.sex = v;
                });
              },
              title: Text('男'),
              subtitle: Text('这是一个二级标题'),
              // secondary: Icon(Icons.sanitizer),
              secondary: Image.network(
                  'https://ae01.alicdn.com/kf/U90d8122435a64a7c8acc9a33a765ea27m.jpg'),
              selected: this.sex == 1,
            ),
            RadioListTile(
              value: 2,
              groupValue: this.sex,
              onChanged: (v) {
                setState(() {
                  this.sex = v;
                });
              },
              title: Text('女'),
              subtitle: Text('这是一个二级标题'),
              secondary: Icon(Icons.six_ft_apart),
              selected: this.sex == 2,
            ),
            SizedBox(
              height: 20,
            ),
            Switch(
                value: this.flag,
                onChanged: (v) {
                  setState(() {
                    print(v);
                    this.flag = v;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 170,
              child: RaisedButton(
                onPressed: () {
                  print('用户名：' + this._userName.text);
                  print('密码：' + this._password);
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

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                labelText: '用户名',
                hintText: '请输入用户名',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.paste_sharp),
                labelText: '密码',
                hintText: '请输入密码',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
                hintText: '可以输入多行文本',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ],
      ),
    );
  }
}
