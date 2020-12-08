import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:market_app/models/product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> products = [];
  final int quantity = 2;

  UnmodifiableListView<Product> get product => UnmodifiableListView(products);

  int get totalPrice => products.length;

  void add(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeAll() {
    products.clear();
    notifyListeners();
  }
}
