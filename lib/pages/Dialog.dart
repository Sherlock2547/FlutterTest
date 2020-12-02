/*
 * @Author: William-Zhou
 * @Date: 2020-11-05 08:32:00
 * @LastEditTime: 2020-11-18 13:50:08
 * @LastEditors: William-Zhou
 * @Description: 
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _alertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息'),
            content: Text('确定要删除吗??'),
            elevation: 24,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  print('取消');
                  Navigator.pop(context, 'Cancle');
                },
                child: Text('取消'),
                color: Colors.purple,
                textColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              RaisedButton(
                onPressed: () {
                  print('确定');
                  Navigator.pop(context, 'OK');
                },
                child: Text('确定'),
                color: Colors.cyan,
                textColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          );
        });
    print(result);
  }

  _simpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择正确答案：'),
          children: [
            SimpleDialogOption(
              child: Text('选项A'),
              onPressed: () {
                print('选择了A！');
                Navigator.pop(context, 'A');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项B'),
              onPressed: () {
                print('选择了B！');
                Navigator.pop(context, 'B');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项C'),
              onPressed: () {
                print('选择了C！');
                Navigator.pop(context, 'C');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项D'),
              onPressed: () {
                print('选择了D！');
                Navigator.pop(context, 'D');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('选项E'),
              onPressed: () {
                print('选择了E！');
                Navigator.pop(context, 'E');
              },
            ),
          ],
        );
      },
    );
    print(result);
  }

  _modelBottomSheet() async {
    var actionSheet = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: [
                ListTile(
                  title: Text('分享 A'),
                  onTap: () {
                    print('分享了A！');
                    Navigator.pop(context, '分享 A');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('分享 B'),
                  onTap: () {
                    print('分享了B！');
                    Navigator.pop(context, '分享 B');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('分享 C'),
                  onTap: () {
                    print('分享了C！');
                    Navigator.pop(context, '分享 C');
                  },
                ),
                Divider(),
              ],
            ),
          );
        });
    print(actionSheet);
  }

  _toast() async {
    Fluttertoast.showToast(
        msg: "toast提示信息",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 3,//only for ios
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dialog页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PopupMenuButton<String>(
              offset: Offset(85, 100),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10)),
              icon: Icon(Icons.add),
              elevation: 5,
              padding: EdgeInsets.all(5),
              // color: Colors.red,
              tooltip: 'PopupMenuButton',
              initialValue: '化学',
              onSelected: (value) {
                print('$value');
              },
              onCanceled: () {
                print('onCanceled');
              },
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: '语文',
                    child: Text('语文'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: '数学',
                    child: Text('数学'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: '英语',
                    child: Text('英语'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: '生物',
                    child: Text('生物'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: '化学',
                    child: Text('化学'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: '语文',
                    enabled: false,
                    child: Text('语文'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: '数学',
                    textStyle: TextStyle(color: Colors.red),
                    child: Text('数学'),
                  ),
                  PopupMenuDivider(
                    height: 50,
                  ),
                  PopupMenuItem<String>(
                    value: '英语',
                    height: 70,
                    child: Text('英语'),
                  ),
                  PopupMenuDivider(),
                  CheckedPopupMenuItem(
                    value: '语文',
                    checked: true,
                    child: Text('语文'),
                  ),
                  PopupMenuDivider(),
                  CheckedPopupMenuItem(
                    value: '数学',
                    child: Text('数学'),
                  ),
                ];
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _alertDialog,
              child: Text('alter弹出框-AlterDialog'),
              color: Colors.cyan,
              textColor: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // RaisedButton(
            //   child: Text('IOSAlertDialog'),
            //   color: Colors.cyan,
            //   textColor: Colors.white,
            //   elevation: 20,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10)),
            //   onPressed: () {
            //     showCupertinoDialog(
            //         context: context,
            //         builder: (context) {
            //           return CupertinoAlertDialog(
            //             title: Text('提示'),
            //             content: Text('确认删除吗？'),
            //             actions: <Widget>[
            //               CupertinoDialogAction(
            //                 child: Text('取消'),
            //                 onPressed: () {},
            //               ),
            //               CupertinoDialogAction(
            //                 child: Text('确认'),
            //                 onPressed: () {},
            //               ),
            //             ],
            //           );
            //         });
            //   },
            // ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _simpleDialog,
              child: Text('select弹出框-SimpleDialog'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 20,
              shape: StadiumBorder(),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _modelBottomSheet,
              child: Text('ActionSheet弹出框'),
              color: Colors.purple,
              textColor: Colors.white,
              elevation: 20,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _toast,
              child: Text('toast弹出框-第三方库'),
              color: Colors.pink,
              textColor: Colors.white,
              elevation: 20,
              shape: BorderDirectional(
                start: BorderSide(color: Colors.green, width: 7),
                end: BorderSide(color: Colors.blue, width: 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
