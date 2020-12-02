/*
 * @Author: William-Zhou
 * @Date: 2020-11-17 10:15:30
 * @LastEditTime: 2020-11-18 14:16:18
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class NestedScrollViewPage extends StatefulWidget {
  @override
  _NestedScrollViewPageState createState() => _NestedScrollViewPageState();
}

class _NestedScrollViewPageState extends State<NestedScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('593.2'),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                title: Text(
                  '滚动隐藏 AppBar',
                  style: TextStyle(fontFamily: 'Shenyun'),
                ),
              )
            ];
          },
          body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 80,
                color: Colors.primaries[index % Colors.primaries.length],
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
            itemCount: 20,
          ),
        ));
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
