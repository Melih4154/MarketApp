import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/screens/product_list.dart';

class TapBarList extends StatefulWidget {
  @override
  _TapBarListState createState() => _TapBarListState();
}

class _TapBarListState extends State<TapBarList>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: Colors.purple,
          labelColor: Colors.purple,
          labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          controller: controller,
          isScrollable: true,
          tabs: [
            Tab(
              child: Text("Temel Gıda"),
            ),
            Tab(
              child: Text("İçecekler"),
            ),
            Tab(
              child: Text("Et ve Balık"),
            ),
            Tab(
              child: Text("Manav"),
            ),
            Tab(
              child: Text("Yiyecek"),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              ProductList(),
              ProductList(),
              ProductList(),
              ProductList(),
              ProductList(),
            ],
          ),
        )
      ],
    );
  }
}
