/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 15:59:53
 * @LastEditTime: 2020-11-17 09:46:33
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //水平滑动
      // scrollDirection: Axis.horizontal,
      //滑动翻转
      // reverse: true,
      // controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          elevation: 20,
          backgroundColor: Colors.pink,
          floating: true,
          // snap: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('复仇者联盟'),
            centerTitle: true,
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 4,
          children: List.generate(8, (index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            );
          }).toList(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              height: 85,
              alignment: Alignment.center,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                '$index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }, childCount: 25),
        )
        // SliverFixedExtentList(
        //   itemExtent: 80.0,
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       while (index < 50) {
        //         return Card(
        //           child: Container(
        //             alignment: Alignment.center,
        //             color: Colors.primaries[(index % 18)],
        //             child: Text('$index'),
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }
}
