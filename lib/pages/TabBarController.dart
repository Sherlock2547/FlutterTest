/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 23:15:14
 * @LastEditTime: 2020-11-02 23:34:52
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import '../res/listData.dart';

class TabBarControllerPage extends StatefulWidget {
  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    //生命周期函数
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
      print(_tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarControllerPage'),
        bottom: TabBar(
          //注意加上这一句
          controller: this._tabController,
          tabs: <Widget>[
            Tab(
              text: '热门',
            ),
            Tab(
              text: '推荐',
            ),
          ],
        ),
      ),
      body: TabBarView(
        //注意加上这一句
        controller: this._tabController,
        children: [
          ListView(
              children: listData.map((e) {
            return Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      e['imageUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        e['imageUrl'],
                      ),
                    ),
                    title: Text(
                      e['title'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      e['author'],
                      maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
          Container(
            height: 800,
            width: 400,
            // color: Colors.pink,
            child: Wrap(
              spacing: 10,
              runSpacing: 15,
              // direction: Axis.vertical,//纵向显示
              runAlignment: WrapAlignment.center,
              // alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                MyButton('第1集'),
                MyButton('第2集'),
                MyButton('第3集'),
                MyButton('第4集'),
                MyButton('第5集'),
                MyButton('第6集'),
                MyButton('第7集'),
                MyButton('第8集'),
                MyButton('第9集'),
                MyButton('第10集'),
                MyButton('第11集'),
                MyButton('第12集'),
                MyButton('第13集'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  const MyButton(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      // textColor: Theme.of(context).accentColor,
      textColor: Colors.blue,
      onPressed: () {},
    );
  }
}
