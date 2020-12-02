/*
 * @Author: William-Zhou
 * @Date: 2020-11-13 10:35:05
 * @LastEditTime: 2020-11-14 12:34:37
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextDemoPage extends StatefulWidget {
  @override
  _TextDemoPageState createState() => _TextDemoPageState();
}

class _TextDemoPageState extends State<TextDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本演示页面',
            style: TextStyle(
              fontFamily: 'Banshu',
            )),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (BuildContext context) {
                  RenderBox box = context.findRenderObject();
                  final Shader linearGradient = LinearGradient(
                    colors: <Color>[Colors.purple, Colors.blue],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 800.0));

                  return Text(
                    '试问天上仙人，谁敢来此人间',
                    style: new TextStyle(
                        fontFamily: 'Banshu',
                        fontSize: 24.0,
                        // fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'Banshu',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue),
                        child: Text(
                          '判断题',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TextSpan(text: '泡沫灭火器可以用于带电灭火吗?'),
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            decoration: InputDecoration(
              fillColor: Color(0x30cccccc),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x00FF0000)),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              hintText: '输入密码',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x00000000)),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            textAlign: TextAlign.center,
            obscureText: true,
            onChanged: (value) {},
          ),
          SizedBox(
            height: 40,
          ),
          Text.rich(
            TextSpan(
                text: '回复',
                style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
                children: [
                  TextSpan(
                    text: '@William：',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('onTap');
                      },
                  ),
                  TextSpan(
                    text: '你好，想知道Flutter发展前景如何？',
                  ),
                ]),
          ),
          // TODO 哈哈哈
          // * 哈哈哈
          // ? 哈哈哈
          // ! 哈哈哈
          SizedBox(
            height: 140,
          ),
          Text.rich(
            TextSpan(
                text: '登录即代表同意并阅读',
                style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
                children: [
                  TextSpan(
                    text: '《服务协议》',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('onTap');
                      },
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
