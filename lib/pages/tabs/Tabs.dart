/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:42:15
 * @LastEditTime: 2020-11-23 20:48:46
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ScaleDemo.dart';
import 'Home.dart';
import 'Category.dart';
import 'Setting.dart';
import 'SettingDemo.dart';
import 'DrawingBoard.dart';

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
    DrawingBoard(),
    CategoryPage(),
    SettingDemo(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            'Williams Flutter Demo',
          ),
          centerTitle: true,
          backgroundColor:
              this._currentIndex == 2 ? Colors.blue : Colors.green),
      // ? 类似咸鱼的加号
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
                icon: Icon(IconData(0xec43, fontFamily: 'Gamepad')),
                title: Text('鱼塘')),
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
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/categoryPage');
              },
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
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.pushNamed(context, '/settingPage');
              },
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
          child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                child: Text('跳转到登录页面'),
                onPressed: () {
                  Navigator.pushNamed(context, '/fromDemo');
                },
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('跳转到注册页面'),
                onPressed: () {
                  Navigator.pushNamed(context, '/registerFirst');
                },
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Get请求数据后渲染'),
                onPressed: () {
                  Navigator.pushNamed(context, '/httpDemo');
                },
                color: Colors.purple,
                textTheme: ButtonTextTheme.primary,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Dio请求数据后渲染'),
                onPressed: () {
                  Navigator.pushNamed(context, '/dioDemo');
                },
                color: Colors.blueAccent,
                textTheme: ButtonTextTheme.primary,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 20,
              ),
              StartClip(),
            ],
          )
        ],
      )),
    );
  }
}
