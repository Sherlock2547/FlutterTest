/*
 * @Author: William-Zhou
 * @Date: 2020-10-30 10:14:53
 * @LastEditTime: 2020-11-23 14:38:58
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutterapp01/pages/tabs/Tabs.dart';
import 'package:flutterapp01/routes/MyRouteObserver.dart';
import 'routes/Routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

MyRouteObserver<PageRoute> myRouteObserver = MyRouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      // home: Tabs(),
      navigatorObservers: [myRouteObserver],
      initialRoute: '/', //初始化使加载的路由
      debugShowCheckedModeBanner: false, //去掉debug图标
      // initialRoute: '/appBarDemo', //初始化使加载的路由
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
