/*
 * @Author: William-Zhou
 * @Date: 2020-11-02 09:46:53
 * @LastEditTime: 2020-11-20 16:23:54
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

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  //动画必须要with这个类
  AnimationController _ctrlAnimationPopMenu; //定义动画的变量
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    //菜单的icon
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    } else {
      _ctrlAnimationPopMenu.status == AnimationStatus.completed
          ? _ctrlAnimationPopMenu.reverse() //展开和收拢的效果
          : _ctrlAnimationPopMenu.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _ctrlAnimationPopMenu = AnimationController(
      //必须初始化动画变量
      duration: const Duration(milliseconds: 250), //动画时长250毫秒
      vsync: this, //SingleTickerProviderStateMixin的作用
    );
  }

//生成Popmenu数据
  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(icon);
        },
        child: Icon(icon, color: Colors.white, size: 30.0),
      ),
    );
  }

  int _index = 0;
  List<Map> imgList = [
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkp4357o3hj31mc1aw43t.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkp41vaa3yj33g02aowz7.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkdk5uy3y9j30jg0caaav.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkp43ude6dj31hc0u0dj0.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprb9ermuj31tm14ugnx.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprd2luw4j33vc2kwql8.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkpre3r96kj32151bgtde.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkpreoneukj34g02yohdt.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkproo21u3j30p00dwq3b.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprqtpah0j32io1k64bg.jpg'},
    {'url': 'http://ww1.sinaimg.cn/large/006XyIeRgy1gkprrad2yoj335r2dhke8.jpg'},
  ];

  List<User> data = [
    User('周文林77', 18),
    User('周文林84', 19, selected: true),
    User('周文林25', 20),
    User('周文林33', 21),
    User('文林64', 22),
  ];
  var _sortAscending = true;
  var _sortColumnIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
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
                        fontSize: 18,
                        // fontWeight: FontWeight.w600,
                        fontFamily: 'Xiaotu'),
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
                        text: '菜单',
                      ),
                      Tab(
                        text: 'PageV',
                      ),
                      Tab(
                        text: 'DataTable',
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          e['imageUrl'], fit: BoxFit.cover,
                          // ? 添加加载时的圆圈
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
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
                          overflow: TextOverflow.ellipsis,
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
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  _buildIndexedStack(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildRow(),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text(
                      '欲买桂花同载酒，终不似、少年游',
                      style: TextStyle(fontFamily: 'Suxin'),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      '欲买桂花同载酒，终不似、少年游',
                      style: TextStyle(fontFamily: 'Xiaotu'),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Flow(
                  delegate: FlowMenuDelegate(animation: _ctrlAnimationPopMenu),
                  children: menuItems
                      .map<Widget>((IconData icon) => flowMenuItem(icon))
                      .toList(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey.withOpacity(.5),
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          _buildCircleImg(),
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: _buildCenter(),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 14,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://ww1.sinaimg.cn/large/006XyIeRgy1gkp4357o3hj31mc1aw43t.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://ae01.alicdn.com/kf/U90d8122435a64a7c8acc9a33a765ea27m.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildPageView()],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataTable(
                      sortColumnIndex: 1,
                      sortAscending: _sortAscending,
                      columns: [
                        DataColumn(
                            label: Text('姓名'),
                            tooltip: '这是姓名列',
                            onSort: (int columnIndex, bool ascending) {
                              setState(() {
                                _sortColumnIndex = columnIndex;
                                _sortAscending = ascending;
                                if (ascending) {
                                  data.sort((a, b) => a.name.compareTo(b.name));
                                } else {
                                  data.sort((a, b) => b.name.compareTo(a.name));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text('年龄'),
                            tooltip: '这是年龄列',
                            onSort: (int columnIndex, bool ascending) {
                              setState(() {
                                _sortColumnIndex = columnIndex;
                                _sortAscending = ascending;
                                if (ascending) {
                                  data.sort((a, b) => a.age.compareTo(b.age));
                                } else {
                                  data.sort((a, b) => b.age.compareTo(a.age));
                                }
                              });
                            }),
                      ],
                      rows: data.map((user) {
                        return DataRow(cells: [
                          DataCell(Text('${user.name}'), showEditIcon: true),
                          DataCell(Text('${user.age}'), showEditIcon: true),
                        ]);
                      }).toList()),
                  _dateTable()
                ],
              )
            ],
          ),
        ));
  }

  _buildIndexedStack() {
    return IndexedStack(
      index: _index,
      children: <Widget>[
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.green,
            alignment: Alignment.center,
            child: Icon(
              Icons.cake,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_cafe,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.fastfood),
          onPressed: () {
            setState(() {
              _index = 0;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.cake),
          onPressed: () {
            setState(() {
              _index = 1;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.local_cafe),
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
        ),
      ],
    );
  }

//!圆形头像代码
  _buildCircleImg() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  'https://ae01.alicdn.com/kf/U90d8122435a64a7c8acc9a33a765ea27m.jpg'))),
    );
  }

//?蓝色描述区域代码
  _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '冬夜读书示子聿',
          style: TextStyle(fontSize: 20, fontFamily: 'Xiaotu'),
        ),
        Text(
          '「 纸上得来终觉浅，绝知此事要躬行。」',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

// * pageView
  List<String> pageList = ['PageView1', 'PageView2', 'PageView3'];
  int _currentPageIndex = 0;

  _buildPageView() {
    return Center(
      child: Container(
        height: 230,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              // controller: PageController(
              //   viewportFraction: 0.9,
              // ),
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index % (pageList.length);
                });
              },
              // itemCount: 10000,
              itemBuilder: (context, index) {
                return _buildPageViewItem(pageList[index % (pageList.length)]);
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageList.length, (i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPageIndex == i
                              ? Colors.blue
                              : Colors.grey),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPageViewItem(String txt, {Color color = Colors.pink}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }

//? DateTable
  _dateTable() {
    List<DataRow> dateRows = [];
    for (int i = 0; i < data.length; i++) {
      dateRows.add(DataRow(
        cells: [
          DataCell(Text('${data[i].name}')),
          DataCell(Text('${data[i].age}')),
          DataCell(Text('男')),
          DataCell(Text('2020')),
          DataCell(Text('10')),
        ],
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: [
        DataColumn(label: Text('姓名')),
        DataColumn(
          label: Text('年龄'),
        ),
        DataColumn(
          label: Text('性别'),
        ),
        DataColumn(
          label: Text('出生年份'),
        ),
        DataColumn(
          label: Text('出生月份'),
        ),
      ], rows: dateRows),
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
      color: Colors.purple,
      textColor: Colors.white,
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {},
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.animation}) : super(repaint: animation);
  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0; //起始位置
    double y = 50.0; //横向展开,y不变
    for (int i = 0; i < context.childCount; ++i) {
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}

class User {
  User(this.name, this.age, {this.selected = false});

  String name;
  int age;
  bool selected;
}
