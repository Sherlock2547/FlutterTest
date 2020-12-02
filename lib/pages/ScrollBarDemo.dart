/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 15:09:04
 * @LastEditTime: 2020-11-16 15:27:14
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class ScrollBarPage extends StatefulWidget {
  @override
  _ScrollBarPageState createState() => _ScrollBarPageState();
}

class _ScrollBarPageState extends State<ScrollBarPage> {
  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    print('滚动组件最大滚动距离:${metrics.maxScrollExtent}');
    print('当前滚动位置:${metrics.pixels}');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动条'),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Scrollbar(
              child: ListView.builder(
                reverse: false,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Text('$index'),
                    ),
                  );
                },
                itemCount: 30,
                itemExtent: 50,
              ),
            )

            //滚动条
            // Container(
            //   alignment: Alignment(1, _alignmentY),
            //   padding: EdgeInsets.only(right: 5),
            //   child: Container(
            //     height: 100,
            //     width: 20,
            //     color: Colors.red,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class _ScrollBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.blue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.arrow_drop_up,
            size: 18,
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 18,
          ),
        ],
      ),
    );
  }
}
