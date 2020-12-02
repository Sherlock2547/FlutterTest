/*
 * @Author: William-Zhou
 * @Date: 2020-11-22 16:49:07
 * @LastEditTime: 2020-11-22 17:28:35
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

//?共享轴模式用于具有空间或导航关系的 UI 元素之间的过渡。
//?此模式在 x，y 或 z 轴上使用共享的变换来加强元素之间的关系。
class ShareAxisDemo extends StatefulWidget {
  @override
  _ShareAxisDemoState createState() => _ShareAxisDemoState();
}

class _ShareAxisDemoState extends State<ShareAxisDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _child = _OnePage();
    switch (_currentIndex) {
      case 1:
        _child = _TwoPage();
        break;
    }
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 1000),
        reverse: false,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            //?类型为 y 轴：transitionType: SharedAxisTransitionType.vertical,
            //?类型为 z 轴：transitionType: SharedAxisTransitionType.scaled,
            //?X  vertical
            transitionType: SharedAxisTransitionType.vertical,
            secondaryAnimation: secondaryAnimation,
          );
        },
        child: _child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('我的'), icon: Icon(Icons.perm_identity)),
        ],
      ),
    );
  }
}

class _OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.withOpacity(.5),
        alignment: Alignment.center,
        child: Image.network(
          'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.withOpacity(.5),
        alignment: Alignment.center,
        child: Image.network(
          'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  final String title;
  final Color color;

  const _DetailPage({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(.5),
      alignment: Alignment.topCenter,
      child: Image.network(
        'http://ww1.sinaimg.cn/large/006XyIeRgy1gks7zslkrjj30dw0jy74x.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
