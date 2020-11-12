/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:44:29
 * @LastEditTime: 2020-11-05 11:21:27
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

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  return new Image.network(
                    imgList[index]['url'],
                    fit: BoxFit.fill,
                  );
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
            RaisedButton(
              child: Text('跳转到商品页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/product');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到appBar'),
              onPressed: () {
                Navigator.pushNamed(context, '/appBarDemo');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到TabController'),
              onPressed: () {
                Navigator.pushNamed(context, '/tabBarController');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到按钮演示界面'),
              onPressed: () {
                Navigator.pushNamed(context, '/buttonPage');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到多选框演示界面'),
              onPressed: () {
                Navigator.pushNamed(context, '/checkBoxDemo');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到系统时间界面'),
              onPressed: () {
                Navigator.pushNamed(context, '/datePicker');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到第三方时间组件界面'),
              onPressed: () {
                Navigator.pushNamed(context, '/datePickerPub');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到轮播图组件界面'),
              onPressed: () {
                Navigator.pushNamed(context, '/swiperDemo');
              },
              color: Colors.cyan,
              textTheme: ButtonTextTheme.primary,
            ),
            RaisedButton(
              child: Text('跳转到Dialog提示组件界面'),
              onPressed: () {
                Navigator.pushNamed(context, '/dialogDemo');
              },
              color: Colors.blue,
              textTheme: ButtonTextTheme.primary,
            ),
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
            ),
          ],
        )
      ],
    );
  }
}
