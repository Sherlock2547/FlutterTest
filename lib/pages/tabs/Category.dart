/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:46:53
 * @LastEditTime: 2020-11-04 23:31:13
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import '../../res/listData.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Map> imgList = [
    {
      'url': 'https://ae01.alicdn.com/kf/U90d8122435a64a7c8acc9a33a765ea27m.jpg'
    },
    {
      'url': 'https://ae01.alicdn.com/kf/Uc75de1d59d1448a3abed7adfe4df9297t.png'
    },
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkdk5uy3y9j30jg0caaav.jpg'},
    {
      'url': 'https://ae01.alicdn.com/kf/U1d9e27cbda65498bbc365ff81328bb92d.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    isScrollable: true, //如果多个按钮的话可以滑动
                    indicatorColor: Colors.pink,
                    labelColor: Colors.pink,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.white,
                    tabs: <Widget>[
                      Tab(
                        text: '热门',
                      ),
                      Tab(
                        text: '推荐',
                      ),
                      Tab(
                        text: '哈哈',
                      ),
                      Tab(
                        text: '同城',
                      ),
                      Tab(
                        text: '推荐1',
                      ),
                      Tab(
                        text: '推荐2',
                      ),
                      Tab(
                        text: '推荐3',
                      ),
                      Tab(
                        text: '推荐4',
                      ),
                      Tab(
                        text: '推荐5',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
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
                  child: Column(
                    children: <Widget>[
                      Container(
                          //适配参数
                          // width: double.infinity,
                          child: AspectRatio(
                        aspectRatio: 5 / 3,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              imgList[index]['url'],
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: imgList.length,
                          //自动轮播
                          autoplay: true,
                          loop: true,
                          pagination: new SwiperPagination(),
                          control: new SwiperControl(),
                        ),
                      )),
                      Wrap(
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
                    ],
                  )),
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
              ),
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
              ),
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
              ),
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
        ));
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
