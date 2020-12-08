import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/models/cart_model.dart';
import 'package:market_app/models/product.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Widget> viewList;

  @override
  void initState() {
    viewList = [
      buildProduct(
        Product(
            1,
            "Süt",
            "Mükemmel Süt",
            1,
            20,
            4.50,
            "https://cdn.pixabay.com/photo/2017/07/05/15/41/milk-2474993_1280.jpg",
            true),
      ),
      buildProduct(
        Product(
            1,
            "Peynir",
            "Mükemmel Peynir",
            1,
            20,
            25.99,
            "https://cdn.pixabay.com/photo/2015/12/26/11/08/kaseplatte-1108564_1280.jpg",
            true),
      ),
    ];
    super.initState();
  }

  buildProduct(Product product) {
    return Consumer<CartModel>(
      builder: (context, cart, child) => Container(
        width: 120.0,
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.url),
            Text(product.productName),
            Text(product.unitPrice.toString() + " TL"),
            GestureDetector(
              onTap: () {
                cart.add(product);
              },
              child: Container(
                width: 150.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.red,
                ),
                child: Text(
                  "Sepete Ekle",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.all(10.0),
      children: viewList,
    );
  }
}
