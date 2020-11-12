/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-10-30 15:56:42
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Williams Flutter Demo'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.add_box_sharp,
            color: Colors.blue,
            size: 40,
          ),
          title: Text(
            '歪比巴卜',
            style: TextStyle(fontSize: 28),
          ),
          subtitle: Text('歪比巴卜111222'),
        ),
        ListTile(
          leading: Icon(
            Icons.access_alarm_sharp,
            color: Colors.blue,
            size: 40,
          ),
          title: Text('歪比巴卜'),
          subtitle: Text('歪比巴卜3345254'),
        ),
        ListTile(
          title: Text('歪比巴卜'),
          subtitle: Text('歪比巴卜3456446'),
          trailing: Icon(
            Icons.access_alarm_sharp,
            color: Colors.blue,
            size: 40,
          ),
        ),
        ListTile(
          leading: Image.network(
              'https://ae01.alicdn.com/kf/U8d1e2d69744d49e3bc1042e13d9d9633S.png'),
          title: Text('歪比巴卜'),
          subtitle: Text('歪比巴卜5347766'),
        ),
        ListTile(
          leading: Image.network(
              'https://ae01.alicdn.com/kf/U8d1e2d69744d49e3bc1042e13d9d9633S.png'),
          title: Text('歪比巴卜'),
          subtitle: Text('歪比巴卜5347766'),
        ),
        ListTile(
          leading: Image.network(
              'https://ae01.alicdn.com/kf/U8d1e2d69744d49e3bc1042e13d9d9633S.png'),
          title: Text('歪比巴卜'),
          subtitle: Text('歪比巴卜5347766'),
          trailing: Image.network(
              'https://ae01.alicdn.com/kf/Ue319b0ed05c544f6bd205bd5d71474c7J.jpg'),
        ),
        ListTile(
          leading: Image.network(
              'https://ae01.alicdn.com/kf/Ue319b0ed05c544f6bd205bd5d71474c7J.jpg'),
          title: Text('歪比巴卜'),
          subtitle: Text('歪比巴卜5347766'),
        ),
      ],
    );
  }
}
