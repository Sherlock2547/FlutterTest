/*
 * @Author: William-Zhou
 * @Date: 2020-11-03 08:40:29
 * @LastEditTime: 2020-11-15 00:09:12
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('个人中心'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Wrap(
              spacing: 5,
              runSpacing: 3,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(10, (i) {
                double w = 50.0 + 10 * i;
                double h = 50.0 + 5 * i;
                return Container(
                  color: Colors.primaries[i],
                  height: h,
                  alignment: Alignment.center,
                  width: w,
                  child: Text('$i'),
                );
              }),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Flow(
            //   delegate: SimpleFlowDelegate(),
            //   children: List.generate(7, (index) {
            //     return Container(
            //       height: 70,
            //       color: Colors.primaries[index % Colors.primaries.length],
            //     );
            //   }),
            // )
          ],
        ));
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; ++i) {
      context.paintChild(i,
          transform: Matrix4.translationValues(0, i * 30.0, 0));
    }
  }

  @override
  bool shouldRepaint(SimpleFlowDelegate oldDelegate) {
    return false;
  }
}
