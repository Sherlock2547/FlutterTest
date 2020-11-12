import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  final String text;

  LoadingDialog(this.text);

  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
