/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 14:58:34
 * @LastEditTime: 2020-11-23 10:21:15
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
import '../pages/TextDemo.dart';
import '../pages/TextField.dart';
import '../pages/SliderDemo.dart';
import '../pages/tabs/Setting.dart';
import '../pages/tabs/Category.dart';
import '../pages/CylinderChart.dart';
import '../pages/ListViewDemo.dart';
import '../pages/ViewPageDemo.dart';
import '../pages/ScrollBarDemo.dart';
import '../pages/SliverDemo.dart';
import '../pages/SliverPage.dart';
import '../pages/SliverAppBarDemo.dart';
import '../pages/SliverPersistentHeaderDemo.dart';
import '../pages/NestedScrollViewDemo.dart';
import '../pages/DragTargetDetailsExample.dart';
import '../pages/InteractiveViewerDemo.dart';
import '../pages/Calculator.dart';
import '../pages/animations/AnimationBaseDemo.dart';
import '../pages/animations/AnimationPage.dart';
import '../pages/animations/TweenDemo.dart';
import '../pages/animations/CurveDemo.dart';
import '../pages/animations/MultiControllerDemo.dart';
import '../pages/animations/AnimationDemo.dart';
import '../pages/animations/AnimatedBuilderDemo.dart';
import '../pages/animations/AnimatedListDemo.dart';
import '../pages/animations/HeroDemo.dart';
import '../pages/animations/ContainerAnimationsDemo.dart';
import '../pages/animations/AxisDemo.dart';
import '../pages/animations/FadeThroughTransitionDemo.dart';
import '../pages/animations/FadeScaleTransitionDemo.dart';
import '../pages/animations/NavigationAnimation.dart';
import '../pages/animations/circle_animation.dart';
import '../pages/animations/CustomCircleProgress.dart';
import '../pages/animations/Rose.dart';
import '../pages/animations/FlipAnimationDemo.dart';
import '../pages/animations/TransformDemo.dart';
import '../pages/animations/FlipUpDemo.dart';
import '../pages/animations/water_ripple_page.dart';
import '../pages/animations/radar.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/product': (context) => ProductPage(),
  '/rose': (context) => Rose(),
  '/calculator': (context) => Calculator(),
  '/radarPage': (context) => RadarPage(),
  '/textDemo': (context) => TextDemoPage(),
  '/waterRipplePage': (context) => WaterRipplePage(),
  '/flipUpDemo': (context) => FlipUpDemo(),
  '/sliderDemo': (context) => SliderDemoPage(),
  '/shareAxisDemo': (context) => ShareAxisDemo(),
  '/flipAnimationDemo': (context) => FlipAnimationDemo(),
  '/animationBaseDemo': (context) => AnimationBaseDemo(),
  '/multiControllerDemo': (context) => MultiControllerDemo(),
  '/transformDemo': (context) => TransformDemo(),
  '/customCircleProgress': (context) => CustomCircleProgress(),
  '/circleProgress': (context) => CircleProgress(),
  '/navigationAnimation': (context) => NavigationAnimation(),
  '/containerAnimationsDemo': (context) => ContainerAnimationsDemo(),
  '/fadeScaleTransitionDemo': (context) => FadeScaleTransitionDemo(),
  '/fadeThroughTransitionDemo': (context) => FadeThroughTransitionDemo(),
  '/animationDemo': (context) => AnimationDemo(),
  '/heroDemo': (context) => HeroDemo(),
  '/animatedBuilderDemo': (context) => AnimatedBuilderDemo(),
  '/animatedListDemo': (context) => AnimatedListDemo(),
  '/curveDemo': (context) => CurveDemo(),
  '/tweenDemo': (context) => TweenDemo(),
  '/animationPage': (context) => AnimationPage(),
  '/settingPage': (context) => SettingPage(),
  '/categoryPage': (context) => CategoryPage(),
  '/cylinderChart': (context) => CylinderChart(),
  '/textFieldPage': (context) => TextFieldDemoPage(),
  '/interactiveViewerDemo': (context) => InteractiveViewerDemo(),
  '/dragTargetDetailsExample': (context) => DragTargetDetailsExample(),
  '/listViewDemo': (context) => ListViewDemo(),
  '/viewPageDemo': (context) => ViewPage(),
  '/scrollBarDemo': (context) => ScrollBarPage(),
  '/sliverPage': (context) => SliverPage(),
  '/sliverDemoPage': (context) => SliverDemoPage(),
  '/sliverAppBarDemo': (context) => SliverAppBarDemo(),
  '/nestedScrollViewDemo': (context) => NestedScrollViewPage(),
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
  '/sliverPersistentHeaderPage': (context) => SliverPersistentHeaderPage(),
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
