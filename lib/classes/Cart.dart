// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, prefer_final_fields

import 'package:flutter/material.dart';
import 'items.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;
  void add(Item item) {
    _items.add(item);
    _price += item.price!;
    notifyListeners();
  }

  void reomve(Item item) {
    _items.remove(item);
    _price -= item.price!;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return _price;
  }

  List<Item> get basketitem {
    return _items;
  }
}
