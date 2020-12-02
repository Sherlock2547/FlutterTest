/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 15:55:44
 * @LastEditTime: 2020-11-17 09:22:37
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver'),
        centerTitle: true,
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.all(10),
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            );
          }, childCount: 5),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            );
          }, childCount: 20),
        )
      ]),
    );
  }
}
