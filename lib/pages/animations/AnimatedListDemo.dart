/*
 * @Author: William-Zhou
 * @Date: 2020-11-20 14:44:21
 * @LastEditTime: 2020-11-20 15:55:36
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedListDemo();
}

class _AnimatedListDemo extends State<AnimatedListDemo>
    with SingleTickerProviderStateMixin {
  List<int> _list = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _addItem() {
    final int _index = _list.length;
    _list.insert(_index, _index);
    _listKey.currentState.insertItem(_index);
  }

  void _removeItem() {
    final int _index = _list.length - 1;
    var item = _list[_index].toString();
    _listKey.currentState.removeItem(
        _index, (context, animation) => _buildItemUD(item, animation));
    _list.removeAt(_index);
  }

  //*左进右出的动画效果
  Widget _buildItemLR(String _item, Animation _animation) {
    return SlideTransition(
      position: _animation
          .drive(CurveTween(curve: Curves.easeIn))
          .drive(Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 1))),
      child: Card(
        child: ListTile(
          title: Text(
            _item,
          ),
        ),
      ),
    );
  }

  //*从上掉落的效果
  Widget _buildItemUD(String _item, Animation _animation) {
    return SizeTransition(
      sizeFactor: _animation,
      child: Card(
        child: ListTile(
          title: Text(
            _item,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表动画'),
        centerTitle: true,
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: (BuildContext context, int index, Animation animation) {
          return _buildItemUD(_list[index].toString(), animation);
        },
      ),
      //?底部的增加/删除列表按钮
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _addItem(),
            child: Icon(Icons.add),
            heroTag: 'one',
          ),
          SizedBox(
            width: 60,
          ),
          FloatingActionButton(
            onPressed: () => _removeItem(),
            child: Icon(Icons.remove),
            heroTag: 'two',
          ),
        ],
      ),
    );
  }
}
