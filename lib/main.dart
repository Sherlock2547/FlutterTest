/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-11-04 14:55:53
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutterapp01/pages/tabs/Tabs.dart';
import 'routes/Routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      // home: Tabs(),
      initialRoute: '/', //初始化使加载的路由
      debugShowCheckedModeBanner: false, //去掉debug图标
      // initialRoute: '/appBarDemo', //初始化使加载的路由
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
