import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fashion_shop/components/cart_products.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              )),
        ],
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Total: '),
                subtitle: Text('\$230'),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Check out',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
