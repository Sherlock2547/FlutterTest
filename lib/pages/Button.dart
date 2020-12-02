/*
 * @Author: William-Zhou
 * @Date: 2020-11-03 08:50:59
 * @LastEditTime: 2020-11-18 14:52:06
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮演示页面',
            style: TextStyle(
              fontFamily: 'Banshu',
            )),
        //右上角的按钮
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.ad_units),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('点击了浮动按钮');
        },
        // child: Icon(Icons.fingerprint),
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        ),
        backgroundColor: Colors.yellow,
        elevation: 20,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('普通按钮'),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('颜色按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.green[50],
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('有阴影按钮'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 50,
                  width: 200,
                  child: RaisedButton.icon(
                      onPressed: () {},
                      color: Colors.green,
                      textColor: Colors.white,
                      elevation: 20,
                      icon: Icon(Icons.search),
                      label: Text('图标按钮')))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('圆角按钮'),
                  color: Colors.purple,
                  textColor: Colors.white,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Container(
          //       height: 60,
          //       // width: 200,
          //       child: RaisedButton(
          //           onPressed: () {},
          //           child: Text('圆形按钮'),
          //           color: Colors.orange,
          //           textColor: Colors.white,
          //           splashColor: Colors.blue,
          //           elevation: 20,
          //           shape: CircleBorder(
          //             side: BorderSide(color: Colors.white),
          //           )),
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('宽度高度'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 50,
                margin: EdgeInsets.all(15),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('自适应按钮'),
                  color: Colors.pink,
                  textColor: Colors.white,
                  elevation: 20,
                ),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 60,
                  // width: 200,
                  child: OutlineButton(
                    onPressed: () {},
                    child: Text('注册'),
                    color: Colors.yellow,
                    textColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              )
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Container(
          //       height: 60,
          //       // width: 200,
          //       child: FlatButton(
          //         onPressed: () {},
          //         child: Text('扁平按钮'),
          //         color: Colors.red,
          //         textColor: Colors.white,
          //         splashColor: Colors.blue,
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: [
                  RaisedButton(
                    onPressed: () {},
                    child: Text('登录'),
                    color: Colors.purple,
                    textColor: Colors.white,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  OutlineButton(
                    onPressed: () {},
                    child: Text('注册'),
                    color: Colors.yellow,
                    textColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  MyButton(
                    text: '自定义按钮',
                    heigth: 40.0,
                    width: 100.0,
                    pressd: () {
                      print('自定义按钮');
                    },
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFDE2F21),
                          Color(0xFFA5DF1D),
                          Color(0xFF138ED4),
                          Color(0xFFC413D4),
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      '这是InkWell的点击效果',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//自定义按钮组件
class MyButton extends StatelessWidget {
  final text;
  final pressd;
  final double width;
  final double heigth;
  const MyButton(
      {this.text = '',
      this.pressd = null,
      this.width = 100.0,
      this.heigth = 40.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.heigth,
      width: this.width,
      child: RaisedButton(
        onPressed: this.pressd,
        child: Text(this.text),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
