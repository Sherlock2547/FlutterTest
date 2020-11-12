/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 14:58:34
 * @LastEditTime: 2020-11-05 23:22:40
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import '../pages/Form.dart';
import '../pages/Search.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/Product.dart';
import '../pages/ProductInfo.dart';
import '../pages/user/Login.dart';
import '../pages/user/RegisterFirst.dart';
import '../pages/user/RegisterSecond.dart';
import '../pages/user/RegisterThird.dart';
import '../pages/appBarDemo.dart';
import '../pages/TabBarController.dart';
import '../pages/User.dart';
import '../pages/Button.dart';
import '../pages/CheckBox.dart';
import '../pages/tabs/FromDemo.dart';
import '../pages/DatePicker.dart';
import '../pages/DatePickerPub.dart';
import '../pages/Swiper.dart';
import '../pages/Dialog.dart';
import '../pages/HttpDemo.dart';
import '../pages/DioDemo.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/product': (context) => ProductPage(),
  '/user': (context) => UserPage(),
  '/form': (context) => FormPage(),
  '/login': (context) => LoginPage(),
  '/httpDemo': (context) => HttpDemo(),
  '/dioDemo': (context) => DioDemoPage(),
  '/dialogDemo': (context) => DialogPage(),
  '/swiperDemo': (context) => SwiperPage(),
  '/datePicker': (context) => DatePickerDemo(),
  '/datePickerPub': (context) => DatePickerPubDemo(),
  '/fromDemo': (context) => FormDemoPage(),
  '/checkBoxDemo': (context) => CheckBoxDemo(),
  '/buttonPage': (context) => ButtonDemoPage(),
  '/registerFirst': (context) => RegisterFirstPage(),
  '/registerSecond': (context) => RegisterSecondPage(),
  '/registerThird': (context) => RegisterThirdPage(),
  '/appBarDemo': (context) => AppBarDemoPage(),
  '/tabBarController': (context) => TabBarControllerPage(),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  '/productInfo': (context, {arguments}) =>
      ProductInfoPage(arguments: arguments)
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
  //统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
