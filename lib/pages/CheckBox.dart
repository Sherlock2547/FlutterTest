/*
 * @Author: William-Zhou
 * @Date: 2020-11-03 15:35:00
 * @LastEditTime: 2020-11-03 16:08:18
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  var flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('多选框'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: this.flag,
                onChanged: (value) {
                  setState(() {
                    this.flag = value;
                  });
                },
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            children: <Widget>[Text(this.flag ? '选中' : '未选中')],
          ),
          SizedBox(
            height: 40,
          ),
          CheckboxListTile(
            value: this.flag,
            onChanged: (value) {
              setState(() {
                this.flag = value;
              });
            },
            title: Text('标题'),
            subtitle: Text('这是一个二级标题'),
            selected: this.flag,
          ),
          Divider(),
          CheckboxListTile(
            value: this.flag,
            onChanged: (value) {
              setState(() {
                this.flag = value;
              });
            },
            title: Text('标题'),
            subtitle: Text('这是一个二级标题'),
            secondary: Icon(Icons.sanitizer),
            selected: this.flag,
          ),
        ],
      ),
    );
  }
}
