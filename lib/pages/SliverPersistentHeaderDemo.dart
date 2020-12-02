/*
 * @Author: William-Zhou
 * @Date: 2020-11-16 16:42:20
 * @LastEditTime: 2020-11-17 10:21:26
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SliverPersistentHeaderPage extends StatefulWidget {
  @override
  _SliverPersistentHeaderPageState createState() =>
      _SliverPersistentHeaderPageState();
}

class _SliverPersistentHeaderPageState
    extends State<SliverPersistentHeaderPage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PersistentHeader'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            // pinned: true,
            delegate: MySliverPersistentHeaderDelegate(),
          ),
          //?CustomScrollView 只能包含 sliver 系列组件，如果包含普通的组件如何处理？使用 SliverToBoxAdapter 包裹。
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: EdgeInsets.all(10),
                //适配参数
                // width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(imgList[index]['url'],
                          fit: BoxFit.fill,
                          // * 添加加载时的圆圈
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      });
                    },
                    itemCount: imgList.length,
                    //自动轮播
                    autoplay: true,
                    loop: true,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                  ),
                )),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
              );
            }, childCount: 21),
          )
        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('我是一个SliverPersistentHeader',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Suxin')));
  }

  @override
  double get maxExtent => 300.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true
}
