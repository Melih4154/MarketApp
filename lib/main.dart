import 'package:flutter/material.dart';
import 'package:market_app/screens/cart_list.dart';
import 'package:market_app/screens/top_bar.list.dart';
import 'package:provider/provider.dart';

import 'models/cart_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> bottomList = List<Widget>();
  @override
  void initState() {
    bottomList = [TapBarList(), CartList()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marketim"),
        centerTitle: true,
      ),
      body: bottomList[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedFontSize: 15.0,
        unselectedFontSize: 15.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Ürünler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Sepetim",
          ),
        ],
        onTap: (int _index) {
          setState(() {
            index = _index;
          });
        },
      ),
    );
  }
}
