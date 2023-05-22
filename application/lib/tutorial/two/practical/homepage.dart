import 'package:flutter/material.dart';

import 'item.dart';
import 'data_item.dart' show ItemData, data;

class _Instructions extends StatelessWidget {
  const _Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Focus(
        autofocus: true,
        child: Text(
          'To go back, swipe down then left with one finger in a continuous action. If multi-gestures are enabled, swipe with two fingers from the left or right side of the screen.',
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Price Range",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ItemsHeading extends StatelessWidget {
  const _ItemsHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Items",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final ItemData data;

  const _ItemCard({Key? key, required this.data}) : super(key: key);

  const _ItemCard.fromData(ItemData data) : this(data: data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text(data.name)),
              body: Item.fromData(data: data),
            ),
          ),
        );
      },
      child: Card(
        key: Key(data.id.toString()),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(data.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rating: ${data.rating}"),
                  Text("Price: ${data.priceCents / 100}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
            const _Instructions(),
            const _Title(),
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
            const _ItemsHeading(),
            Expanded(
              child: ListView(
                children: _data.map(_ItemCard.fromData).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
