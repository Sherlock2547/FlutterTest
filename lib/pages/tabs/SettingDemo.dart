/*
 * @Author: William-Zhou
 * @Date: 2020-11-15 00:13:03
 * @LastEditTime: 2020-11-18 14:00:39
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';

class SettingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        _SettingItem(
          iconData: Icons.notifications,
          iconColor: Colors.blue,
          title: '消息中心',
          suffix: _NotificationsText(
            text: '12',
          ),
        ),
        Divider(),
        _SettingItem(
          iconData: Icons.thumb_up,
          iconColor: Colors.green,
          title: '我赞过的',
          suffix: _Suffix(
            text: '121篇',
          ),
        ),
        Divider(),
        _SettingItem(
          iconData: Icons.grade,
          iconColor: Colors.orange,
          title: '收藏集',
          suffix: _Suffix(
            text: '2个',
          ),
        ),
        Divider(),
        _SettingItem(
          iconData: Icons.shopping_basket,
          iconColor: Colors.yellow,
          title: '已购小册',
          suffix: _Suffix(
            text: '100个',
          ),
        ),
        Divider(),
        _SettingItem(
          iconData: Icons.account_balance_wallet,
          iconColor: Colors.blue,
          title: '我的钱包',
          suffix: _Suffix(
            text: '￥107500.00',
          ),
        ),
        Divider(),
        _SettingItem(
          iconData: Icons.location_on,
          iconColor: Colors.pink,
          title: '阅读过的文章',
          suffix: _Suffix(
            text: '1034篇',
          ),
        ),
        Divider(),
        _SettingItem(
          iconData: Icons.local_offer,
          iconColor: Colors.purple,
          title: '标签管理',
          suffix: _Suffix(
            text: '27个',
          ),
        ),
        Divider(),
      ],
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem(
      {Key key, this.iconData, this.iconColor, this.title, this.suffix})
      : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          Icon(
            iconData,
            color: iconColor,
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text('$title'),
          ),
          suffix,
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}

// !消息中心和其他行最后的样式不一样，单独封装，带红色背景的组件
class _NotificationsText extends StatelessWidget {
  final String text;

  const _NotificationsText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.red),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

// ? 灰色后缀组件
class _Suffix extends StatelessWidget {
  final String text;

  const _Suffix({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(color: Colors.grey.withOpacity(.5)),
    );
  }
}
