/*
 * @Author: William-Zhou
 * @Date: 2020-11-05 10:46:41
 * @LastEditTime: 2020-11-05 11:20:34
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  final String title;
  final String content;

  MyDialog({this.title = '', this.content = ''});

  _showTimer(context) {
    var timer;
    timer = Timer.periodic(Duration(seconds: 2), (t) {
      print('Dialog关闭');
      Navigator.pop(context);
      t.cancel(); //取消定时器
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('${this.title}'),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close_sharp),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                //宽度延伸至与外部容器等宽
                width: double.infinity,
                child: Text(
                  '${this.content}',
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
