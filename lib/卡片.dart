/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-11-01 23:22:57
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'res/listData.dart';

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
        children: listData.map((e) {
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                e['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  e['imageUrl'],
                ),
              ),
              title: Text(
                e['title'],
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                e['author'],
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }).toList());
  }
}
