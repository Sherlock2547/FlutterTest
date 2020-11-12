/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 15:14:07
 * @LastEditTime: 2020-11-02 15:23:22
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  Map arguments;
  ProductInfoPage({Key key, this.arguments}) : super(key: key);
  @override
  _ProductInfoPageState createState() =>
      _ProductInfoPageState(arguments: this.arguments);
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  Map arguments;
  _ProductInfoPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: Container(
        child: Text('pid=${arguments['pid']}'),
      ),
    );
  }
}
