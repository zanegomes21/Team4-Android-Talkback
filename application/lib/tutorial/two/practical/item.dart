import 'dart:ui';

import 'package:application/tutorial/two/practical/data_item.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String name;
  final int price;
  final double? rating;
  final String description;

  const Item({
    Key? key,
    required this.name,
    required this.price,
    required this.description,
    this.rating,
  }) : super(key: key);

  Item.fromData({
    required ItemData data,
  }) : this(
          key: Key(data.id.toString()),
          name: data.name,
          price: data.priceCents,
          description: data.description,
          rating: data.rating,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price: \$${price / 100}"),
                Text("Rating: ${rating ?? 'N/A'}"),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Watch List'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
