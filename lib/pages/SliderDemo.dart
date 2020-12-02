/*
 * @Author: William-Zhou
 * @Date: 2020-11-13 11:16:22
 * @LastEditTime: 2020-11-14 14:59:36
 * @LastEditors: William-Zhou
 * @Description: 
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderDemoPage extends StatefulWidget {
  @override
  _SliderDemoPageState createState() => _SliderDemoPageState();
}

class _SliderDemoPageState extends State<SliderDemoPage> {
  double _sliderValue = 1;
  RangeValues _rangeValues = RangeValues(0, 25);
  var _switchValue = false;
  _buildSwitch() {
    return Switch(
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('滑块和进度条组件'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('值：$_sliderValue'),
            // Slider(
            //   value: _sliderValue,
            //   onChanged: (v) {
            //     setState(() {
            //       _sliderValue = v;
            //     });
            //   },
            // ),
            // ? 自适应系统滑块
            // Slider.adaptive(
            //   value: _sliderValue,
            //   onChanged: (v) {
            //     setState(() {
            //       _sliderValue = v;
            //     });
            //   },
            // ),
            // * IOS风格的滑块
            // CupertinoSlider(
            //   value: _sliderValue,
            //   onChanged: (v) {
            //     setState(() {
            //       _sliderValue = v;
            //     });
            //   },
            // ),
            Slider(
              value: _sliderValue,
              label: '$_sliderValue',
              min: 0,
              max: 100,
              divisions: 50,
              onChanged: (v) {
                setState(() {
                  _sliderValue = v;
                });
              },
            ),
            Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.blue,
              value: _sliderValue,
              label: '$_sliderValue',
              min: 0,
              max: 100,
              divisions: 50,
              onChanged: (v) {
                setState(() {
                  _sliderValue = v;
                });
              },
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color(0xff404080),
                  thumbColor: Colors.blue,
                  overlayColor: Colors.green,
                  valueIndicatorColor: Colors.purpleAccent),
              child: Slider(
                value: _sliderValue,
                label: '$_sliderValue',
                min: 0,
                max: 100,
                divisions: 50,
                onChanged: (v) {
                  setState(() {
                    _sliderValue = v;
                  });
                },
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              ),
              child: Slider(
                value: _sliderValue,
                label: '$_sliderValue',
                min: 0,
                max: 100,
                divisions: 50,
                onChanged: (v) {
                  setState(() {
                    _sliderValue = v;
                  });
                },
              ),
            ),

            RangeSlider(
              values: _rangeValues,
              labels:
                  RangeLabels('${_rangeValues.start}', '${_rangeValues.end}'),
              min: 0,
              max: 100,
              divisions: 50,
              onChanged: (v) {
                setState(() {
                  _rangeValues = v;
                });
              },
            ),
            LinearProgressIndicator(),
            Divider(),
            LinearProgressIndicator(
              value: 0.3,
            ),
            Divider(),
            LinearProgressIndicator(
              value: 0.3,
              backgroundColor: Colors.greenAccent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            Divider(),
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              value: 0.3,
              backgroundColor: Colors.greenAccent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            SizedBox(
              height: 40,
            ),
            CupertinoActivityIndicator(
              radius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
