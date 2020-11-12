/*
 * @Author: William-Zhou
 * @Date: 2020-11-04 10:26:20
 * @LastEditTime: 2020-11-04 21:53:46
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerPubDemo extends StatefulWidget {
  @override
  _DatePickerPubDemoState createState() => _DatePickerPubDemoState();
}

class _DatePickerPubDemoState extends State<DatePickerPubDemo> {
  DateTime _dateTime = DateTime.now();
  _showDatePicker() async {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime.parse('1980-01-01'),
      maxDateTime: DateTime.parse('2121-01-01'),
      initialDateTime: _dateTime,
      // dateFormat: 'yyyy-MMMM-dd',
      //显示时分
      dateFormat: 'M月d日 EEE,H时:m分',
      pickerMode: DateTimePickerMode.datetime,

      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
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
                  Text('${formatDate(_dateTime, [
                    yyyy,
                    '年',
                    mm,
                    '月',
                    dd,
                    '日',
                    HH,
                    '时',
                    nn,
                    '分',
                    ss,
                    '秒'
                  ])}'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker,
            ),
          ])
        ],
      ),
    );
  }
}
