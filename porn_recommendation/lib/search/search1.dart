import 'package:flutter/material.dart';
import 'package:porn_recommendation/component.dart';
import 'package:porn_recommendation/style.dart';

class SearchPage1 extends StatefulWidget {
  const SearchPage1({Key? key}) : super(key: key);

  @override
  State<SearchPage1> createState() => _SearchPage1State();
}

class _SearchPage1State extends State<SearchPage1> {
  double _minReqViews = 50000;
  final double _maxViews = 100000;
  final double _minViews = 0;
  RangeValues _durationValue = RangeValues(10000, 40000);
  final double _minDuration = 0;
  final double _maxDuration = 50000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fillStrokeText("Duration of the Video", lightPink, 14),
              const SizedBox(
                height: 30,
              ),
              durationSlider(),
              const SizedBox(
                height: 30,
              ),
              fillStrokeText("Minimum Views", lightPink, 14),
              const SizedBox(height: 40),
              viewsSlider(),
              const SizedBox(height: 90),
              const ButtonRow()
            ],
          ),
        ),
        const Spacer(flex: 1)
      ],
    ));
  }

  RangeSlider durationSlider() {
    return RangeSlider(
      min: _minDuration,
      max: _maxDuration,
      values: _durationValue,
      onChanged: (rangeValues) => setState(() => _durationValue = rangeValues),
      labels: RangeLabels(
        _durationValue.start.round().toString(),
        _durationValue.end.round().toString(),
      ),
      divisions: 1000,
      activeColor: lightPink,
      inactiveColor: lightPink,
    );
  }

  Slider viewsSlider() {
    return Slider(
        min: _minViews,
        max: _maxViews,
        divisions: 1000,
        thumbColor: lightPink,
        activeColor: lightPink50,
        inactiveColor: lightPink50,
        label: _minReqViews.round().toString(),
        value: _minReqViews,
        onChanged: (value) {
          setState(() {
            _minReqViews = value;
          });
        });
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GradientBtn(
          goBack: true,
          gradient: purpleGradientColor,
        ),
        GradientBtn(
            goBack: false, gradient: pinkGradientColor, path: "/search2")
      ],
    );
  }
}
