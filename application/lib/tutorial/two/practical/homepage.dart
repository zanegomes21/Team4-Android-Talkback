import 'package:application/tutorial/two/practical/pricerangeslider.dart';
import 'package:flutter/material.dart';

import 'item.dart';
import 'data_item.dart' show data;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void onRangeUpdate(RangeValues values) {
    print("Range updated: ${values.start} - ${values.end}");
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
            PriceRangeSlider(onRangeUpdate: onRangeUpdate),
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
                children: data
                    .where((d) => d.price >= 0 && d.price <= 10000)
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
                                    Text("Price: ${d.price / 100}"),
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
