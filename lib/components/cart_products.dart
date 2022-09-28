import 'dart:ui';

import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({super.key});

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_in_the_cart = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'price': 85,
      'size': 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      'name': 'Red dress',
      'picture': 'images/products/dress1.jpeg',
      'price': 50,
      'size': 'L',
      'color': 'Red',
      'quantity': 2,
    },
    {
      'name': 'Shoes',
      'picture': 'images/products/hills1.jpeg',
      'price': 59,
      'size': 'L',
      'color': 'Black',
      'quantity': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Single_cart_product(
            cart_prod_color: products_in_the_cart[index]['color'],
            cart_prod_name: products_in_the_cart[index]['name'],
            cart_prod_picture: products_in_the_cart[index]['picture'],
            cart_prod_price: products_in_the_cart[index]['price'],
            cart_prod_qty: products_in_the_cart[index]['quantity'],
            cart_prod_size: products_in_the_cart[index]['size']);
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  const Single_cart_product(
      {super.key,
      required this.cart_prod_color,
      required this.cart_prod_name,
      required this.cart_prod_picture,
      required this.cart_prod_price,
      required this.cart_prod_qty,
      required this.cart_prod_size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: Card(
        child: ListTile(
          //dense: true,
          visualDensity: VisualDensity(vertical: 4),
          leading: Image.asset(
            cart_prod_picture,
            width: 80.0,
          ),
          title: Container(
              alignment: Alignment.bottomLeft,
              height: 30.0,
              child: Text(cart_prod_name)),
          subtitle: Column(
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Size: '),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text('Color: '),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ]),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '\$$cart_prod_price',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.red),
                ),
              )
            ],
          ),
          trailing: Container(
            height: 100.0,
            child: Column(
              children: [
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_drop_up,
                    )),
                Text(
                  '$cart_prod_qty',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                InkWell(onTap: () {}, child: Icon(Icons.arrow_drop_down)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
