import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.product.length,
                  itemBuilder: (context, index) {
                    final product = cart.products[index];
                    return ListTile(
                      leading: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image(
                            image: NetworkImage(product.url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(product.productName),
                      subtitle: Text(product.description),
                      trailing: Text(product.unitPrice.toString() + " TL"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
