/*
 * @Author: William-Zhou
 * @Date: 2020-11-04 10:26:20
 * @LastEditTime: 2020-11-17 11:05:59
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  var _nowDate = DateTime.now();
  var _nowTime = TimeOfDay(hour: 12, minute: 20);
  _showDatePicker() async {
    //方法1
    // showDatePicker(
    //         context: context,
    //         initialDate: _nowDate,
    //         firstDate: DateTime(1980),
    //         lastDate: DateTime(2100))
    //     .then((value) => print(value));

    //方法2
    var result = await showDatePicker(
      context: context,
      initialDate: _nowDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
      helpText: '选日期啊',
      errorFormatText: '错误的日期格式啊',
      errorInvalidText: '日期格式非法啊',
      fieldHintText: '年/月/日',
      fieldLabelText: '填写日期吧',
      // locale: Locale('zh')
    );
    print(result);
    setState(() {
      if (result == null) {
        this._nowDate = _nowDate;
      } else {
        this._nowDate = result;
      }
    });
  }

  _showTimePicker() {
    showTimePicker(context: context, initialTime: _nowTime).then((value) {
      setState(() {
        if (value == null) {
          this._nowTime = _nowTime;
        } else {
          this._nowTime = value;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    print(now);
    print(now.microsecondsSinceEpoch);
    print(now.millisecondsSinceEpoch);
    // print(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch));
    print(formatDate(DateTime.now(),
        [yyyy, '年', mm, '月', dd, '日', HH, '时', nn, '分', ss, '秒']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DatePickerDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日'])}'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${_nowTime.format(context)}'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showTimePicker,
            ),
          ])
        ],
      ),
    );
  }
}
