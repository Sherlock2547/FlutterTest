// /*
//  * @Author: William-Zhou
//  * @Date: 2020-11-16 15:43:21
//  * @LastEditTime: 2020-11-16 15:45:39
//  * @LastEditors: William-Zhou
//  * @Description:
//  */

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

// class ScrollTopPage extends StatefulWidget {
//   @override
//   _ScrollTopPageState createState() => _ScrollTopPageState();
// }

// class _ScrollTopPageState extends State<ScrollTopPage> {
//   ScrollController _controller = new ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       print(_controller.offset); //打印滚动位置
//       double t = _controller.offset / DEFAULT_SCROLLER;
//       if (t < 0.0) {
//         t = 0.0;
//       } else if (t > 1.0) {
//         t = 1.0;
//       }
//       setState(() {
//         toolbarOpacity = t;
//       });
//       if (_controller.offset < DEFAULT_SHOW_TOP_BTN && showToTopBtn) {
//         setState(() {
//           showToTopBtn = false;
//         });
//       } else if (_controller.offset >= DEFAULT_SHOW_TOP_BTN && !showToTopBtn) {
//         setState(() {
//           showToTopBtn = true;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           MediaQuery.removePadding(
//             removeTop: true,
//             context: context,
//             child: ListView.builder(
//               // ScrollController 关联滚动组件
//               controller: _controller,
//               itemCount: 100,
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   return Container(
//                     height: 200,
//                     child: Swiper(
//                       itemBuilder: (BuildContext context, int index) {
//                         return new Image.network(
//                           "http://via.placeholder.com/350x150",
//                           fit: BoxFit.fill,
//                         );
//                       },
//                       itemCount: 3,
//                       autoplay: true,
//                       pagination: new SwiperPagination(),
//                     ),
//                   );
//                 }
//                 return ListTile(
//                   title: Text("ListTile:$index"),
//                 );
//               },
//             ),
//           ),
//           Opacity(
//             opacity: toolbarOpacity,
//             child: Container(
//               height: 98,
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30.0),
//                 child: Center(
//                   child: Text(
//                     "ScrollerDemo",
//                     style: TextStyle(color: Colors.white, fontSize: 20.0),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: !showToTopBtn
//           ? null
//           : FloatingActionButton(
//               child: Icon(Icons.keyboard_arrow_up),
//               onPressed: () {
//                 _controller.animateTo(0.0,
//                     duration: Duration(milliseconds: 500), curve: Curves.ease);
//               },
//             ),
//     );
//   }
// }
