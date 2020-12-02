/*
 * @Author: William-Zhou
 * @Date: 2020-11-03 15:35:00
 * @LastEditTime: 2020-11-13 11:23:27
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

  var _radioValue = '1';
  var _radioGroupValue = '语文';
  _buildEditable() {
    return Radio(
      value: _radioValue,
      groupValue: _radioGroupValue,
      onChanged: (value) {
        print('$value');
        setState(() {
          _radioGroupValue = value;
        });
      },
    );
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
          Divider(),
          Row(
            children: <Widget>[
              Flexible(
                child: RadioListTile(
                  activeColor: Colors.red,
                  title: Text('语文'),
                  value: '语文',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                ),
              ),
              Flexible(
                  child: RadioListTile(
                title: Text('数学'),
                value: '数学',
                groupValue: _radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue = value;
                  });
                },
              )),
              Flexible(
                  child: RadioListTile(
                activeColor: Colors.cyan,
                title: Text('英语'),
                value: '英语',
                groupValue: _radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue = value;
                  });
                },
              )),
            ],
          )
        ],
      ),
    );
  }
}
