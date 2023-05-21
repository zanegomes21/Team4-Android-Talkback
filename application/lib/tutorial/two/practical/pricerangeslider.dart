import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  final Function onRangeUpdate;

  const PriceRangeSlider({Key? key, required this.onRangeUpdate})
      : super(key: key);

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  static const double minRange = 0;
  static const double maxRange = 200;
  static const int divisions = 5;

  RangeValues _currentRangeValues = const RangeValues(minRange, maxRange);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      min: minRange,
      max: maxRange,
      divisions: divisions,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
          widget.onRangeUpdate(_currentRangeValues);
        });
      },
    );
  }
}
