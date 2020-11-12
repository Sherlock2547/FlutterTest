/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-11-01 21:56:36
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'res/listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Williams Flutter Demo'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: 400,
          height: 200.0,
          color: Colors.blue,
          child: Text('你好Flutter'),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  height: 180.0,
                  child: Image.network(
                      'https://www.itying.com/images/flutter/2.png',
                      fit: BoxFit.cover),
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: Container(
                    height: 180.0,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 85.0,
                          child: Image.network(
                              'https://www.itying.com/images/flutter/3.png',
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 85.0,
                          child: Image.network(
                              'https://www.itying.com/images/flutter/4.png',
                              fit: BoxFit.cover),
                        ),
                      ],
                    )))
          ],
        )
      ],
    );
  }
}

class IconCotainer extends StatelessWidget {
  double size = 32.0;
  Color color = Colors.red;
  IconData icon;

  IconCotainer(this.icon, {this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: this.color,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
    );
  }
}
