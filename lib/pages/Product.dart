/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 15:07:46
 * @LastEditTime: 2020-11-23 14:16:26
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _string = 'A页面';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品页面'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text(_string),
            // onPressed: () {
            //   Navigator.pushNamed(context, '/search', arguments: {'id': 123});
            // },
            onPressed: () async {
              var result = await Navigator.of(context).pushNamed('/search');
              setState(() {
                _string = result;
              });
            },
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          ),
          RaisedButton(
            child: Text('跳转到商品详情页面'),
            onPressed: () {
              Navigator.pushNamed(context, '/productInfo', arguments: {
                'pid': 309084943,
              });
            },
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          )
        ],
      ),
    );
  }
}
