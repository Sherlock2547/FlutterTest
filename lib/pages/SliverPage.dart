/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 16:01:54
 * @LastEditTime: 2020-11-17 10:18:05
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class SliverDemoPage extends StatefulWidget {
  @override
  _SliverDemoPageState createState() => _SliverDemoPageState();
}

class _SliverDemoPageState extends State<SliverDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverDemoes'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Divider(),
          RaisedButton(
            child: Text('跳转到Sliver界面'),
            onPressed: () {
              Navigator.pushNamed(context, '/sliverPage');
            },
            color: Colors.blue,
            textTheme: ButtonTextTheme.primary,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Divider(),
          RaisedButton(
            child: Text('SliverAppBar界面'),
            onPressed: () {
              Navigator.pushNamed(context, '/sliverAppBarDemo');
            },
            color: Colors.blue,
            textTheme: ButtonTextTheme.primary,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Divider(),
          RaisedButton(
            child: Text('SliverPersistentHeader'),
            onPressed: () {
              Navigator.pushNamed(context, '/sliverPersistentHeaderPage');
            },
            color: Colors.blue,
            textTheme: ButtonTextTheme.primary,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Divider(),
          RaisedButton(
            child: Text('nestedScrollViewDemo'),
            onPressed: () {
              Navigator.pushNamed(context, '/nestedScrollViewDemo');
            },
            color: Colors.blue,
            textTheme: ButtonTextTheme.primary,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Divider(),
        ],
      ),
    );
  }
}
