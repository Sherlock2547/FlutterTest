/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:44:29
 * @LastEditTime: 2020-11-23 20:49:24
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../components/MyDialog.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // int countNum = 0;
  List list = new List();
  List<Map> imgList = [
    {'url': 'https://www.itying.com/images/flutter/4.png'},
    {'url': 'https://www.itying.com/images/flutter/5.png'},
    {'url': 'https://www.itying.com/images/flutter/6.png'},
    {'url': 'https://www.itying.com/images/flutter/7.png'},
  ];

  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    // fToast.showToast(
    //     child: toast,
    //     toastDuration: Duration(seconds: 2),
    //     positionedToastBuilder: (context, child) {
    //       return Positioned(
    //         child: child,
    //         top: 16.0,
    //         left: 16.0,
    //       );
    //     });
  }

  DateTime _lastQuitTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_lastQuitTime == null ||
              DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
            print('再按一次 Back 按钮退出');
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(
              //? 默认底部弹出悬浮
              // behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 3),
              action: SnackBarAction(
                label: '确定',
                onPressed: () {
                  print('确定');
                },
                textColor: Colors.purple,
              ),
              content: Text(
                '再按一次退出',
                style: TextStyle(fontFamily: 'Suxin', color: Colors.white),
              ),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.blue,
              elevation: 20,
            ));
            return false;
          } else {
            print('退出');
            Navigator.of(context).pop(true);
            return true;
          }
        },
        child: ListView(
          children: <Widget>[
            // Column(
            //   children: <Widget>[
            //     Column(
            //       children: this.list.map((e) {
            //         return ListTile(
            //           title: Text(e),
            //         );
            //       }).toList(),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // RaisedButton(
            //     child: Text('按钮'),
            //     onPressed: () {
            //       setState(() {
            //         this.list.add('新增数据1');
            //         this.list.add('新增数据2');
            //       });
            //     }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    //适配参数
                    // width: double.infinity,
                    child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(imgList[index]['url'],
                          fit: BoxFit.fill,
                          // * 添加加载时的圆圈
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      });
                    },
                    itemCount: imgList.length,
                    //自动轮播
                    autoplay: true,
                    loop: true,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                  ),
                )),
                // RaisedButton(
                //   child: Text('跳转到搜索页面'),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/search', arguments: {'id': 123});
                //   },
                //   color: Theme.of(context).accentColor,
                //   textTheme: ButtonTextTheme.primary,
                // ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到商品页面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/product');
                  },
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                // RaisedButton(
                //   child: Text('跳转到appBar'),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/appBarDemo');
                //   },
                //   color: Theme.of(context).accentColor,
                //   textTheme: ButtonTextTheme.primary,
                //   elevation: 10,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20)),
                // ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到文本演示界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/textDemo');
                  },
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到列表界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/listViewDemo');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('打开计算器'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/calculator');
                  },
                  color: Colors.pink,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('动画组件'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/animationPage');
                  },
                  color: Colors.orange,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到表单界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/textFieldPage');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到TabController'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/tabBarController');
                  },
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到按钮演示界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/buttonPage');
                  },
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到单/多选框演示界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkBoxDemo');
                  },
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到系统时间界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/datePicker');
                  },
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到第三方时间组件界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/datePickerPub');
                  },
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到半圆菜单组件界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/swiperDemo');
                  },
                  color: Colors.cyan,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到Dialog提示组件界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/dialogDemo');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('显示自定义Dialog'),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/dialogDemo');
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MyDialog(
                            title: '这是MyDialog标题',
                            content: '这是MyDialog的内容',
                          );
                        });
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到滑块和进度条组件界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sliderDemo');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到柱状图组件界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cylinderChart');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到ViewPage界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewPageDemo');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到滚动条界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/scrollBarDemo');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到Sliver界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sliverDemoPage');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到拖拽组件界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/dragTargetDetailsExample');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Divider(),
                RaisedButton(
                  child: Text('跳转到缩放组件界面'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/interactiveViewerDemo');
                  },
                  color: Colors.blue,
                  textTheme: ButtonTextTheme.primary,
                  elevation: 10,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),

                Divider(),
                SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        ));
  }
}
