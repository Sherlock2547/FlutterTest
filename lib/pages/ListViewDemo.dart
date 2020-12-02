/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 09:02:39
 * @LastEditTime: 2020-11-16 09:25:52
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        print('${_controller.position}');
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Container(
            child: RaisedButton(
              color: Colors.blue,
              textTheme: ButtonTextTheme.primary,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text('滚动到指定位置'),
              onPressed: () {
                _controller.animateTo(900,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: _controller,
              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                return _ListItem(
                  title: '$index',
                );
              },
              itemCount: 50,
              itemExtent: 50,
            ),
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;

  const _ListItem({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text('$title'),
        // color: Colors.green,
      ),
    );
  }
}
