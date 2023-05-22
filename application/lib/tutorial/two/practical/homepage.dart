import 'package:flutter/material.dart';

import 'item.dart';
import 'data_item.dart' show ItemData, data;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double minRange = 0;
  static const double maxRange = 100;
  static const int divisions = 10;

  Iterable<ItemData> _data = data;

  RangeValues _currentRangeValues = const RangeValues(minRange, maxRange);

  void onRangeUpdate(RangeValues values) {
    setState(() {
      _data = data.where(
        (d) =>
            d.priceCents / 100 >= values.start &&
            d.priceCents / 100 <= values.end,
      );
      print("Range updated: ${values.start} - ${values.end}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutorial 2 Practical Exercise"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Focus(
                autofocus: true,
                child: Text(
                    'To go back, swipe down then left with one finger in a continuous action. If multi-gestures are enabled, swipe with two fingers from the left or right side of the screen.'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Toy Shop",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RangeSlider(
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
                  onRangeUpdate(_currentRangeValues);
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Items",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: _data
                    .map(
                      (d) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(title: Text(d.name)),
                                body: Item.fromData(data: d),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          key: Key(d.id.toString()),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(d.name),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Rating: ${d.rating}"),
                                    Text("Price: ${d.priceCents / 100}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
