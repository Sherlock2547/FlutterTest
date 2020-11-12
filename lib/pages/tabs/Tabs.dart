/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:42:15
 * @LastEditTime: 2020-11-03 14:51:43
 * @LastEditors: William-Zhou
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'Home.dart';
import 'Category.dart';
import 'Setting.dart';
import '../../pages/Button.dart';
import '../../pages/appBarDemo.dart';
import '../../pages/TextField.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);
  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  _TabsState(index) {
    this._currentIndex = index;
  }

  List _pageList = [
    HomeContent(),
    TextFieldDemoPage(),
    CategoryPage(),
    ButtonDemoPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('William的 Flutter Demo'),
          backgroundColor:
              this._currentIndex == 2 ? Colors.blue : Colors.green),
      //浮动按钮
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: FloatingActionButton(
          onPressed: () {
            print('floatingActionButton tabs');
            setState(() {
              this._currentIndex = 2;
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: this._currentIndex == 2 ? Colors.blue : Colors.green,
          // elevation: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageList[this._currentIndex],
      // body: HomeContent(),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          fixedColor: Colors.blue,
          currentIndex: this._currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed, //配置底部可以有多个按钮
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), title: Text('鱼塘')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('分类')),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text('消息')),
            BottomNavigationBarItem(icon: Icon(Icons.usb), title: Text('设置')),
          ]),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  // child: DrawerHeader(
                  //   child: Text(''),
                  //   decoration: BoxDecoration(
                  //       color: Colors.blue,
                  //       image: DecorationImage(
                  //           image: NetworkImage(
                  //               'https://www.itying.com/images/flutter/2.png'),
                  //           fit: BoxFit.cover)),
                  // ),
                  child: UserAccountsDrawerHeader(
                    accountEmail: Text('williamz73@foxmail.com'),
                    accountName: Text('William'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/5.png'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.itying.com/images/flutter/2.png'),
                            fit: BoxFit.cover)),
                    otherAccountsPictures: [
                      //最多显示三张图片
                      Image.network(
                          'https://ae01.alicdn.com/kf/U1d9e27cbda65498bbc365ff81328bb92d.jpg'),
                      Image.network(
                          'https://ae01.alicdn.com/kf/Uc75de1d59d1448a3abed7adfe4df9297t.png'),
                      Image.network(
                          'https://ae01.alicdn.com/kf/U90d8122435a64a7c8acc9a33a765ea27m.jpg'),
                      Image.network(
                          'https://www.itying.com/images/flutter/6.png'),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('我的空间'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text('个人中心'),
              onTap: () {
                Navigator.of(context).pop(); //返回时隐藏侧边栏
                Navigator.pushNamed(context, '/user');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置中心'),
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}
