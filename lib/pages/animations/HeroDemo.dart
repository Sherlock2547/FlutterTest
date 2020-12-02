/*
 * @Author: William-Zhou
 * @Date: 2020-11-20 16:02:56
 * @LastEditTime: 2020-11-20 16:38:31
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class HeroDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeroDemo();
}

class _HeroDemo extends State<HeroDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero动画'),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        children: List.generate(12, (index) {
          if (index == 7) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new _Hero1Demo()));
              },
              //? 2个页面都有 Hero 控件，且 tag 参数一致。
              child: Hero(
                  tag: 'hero',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Image.network(
                        'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            );
          }
          return Container(
            // margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.primaries[index % Colors.primaries.length],
            ),
          );
        }),
      ),
    );
  }
}

class _Hero1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '迪丽热巴',
          style:
              TextStyle(fontFamily: 'Xiaotu', fontSize: 24, color: Colors.pink),
        ),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Hero(
            tag: 'hero',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                // height: 250,
                width: 350,
                child: Image.network(
                  'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
