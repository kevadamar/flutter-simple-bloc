import 'package:flutter/material.dart';

class ItemModel {
  final int id;
  final String name;
  final Color color;
  final int price = 7000;

  ItemModel(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];
}
