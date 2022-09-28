import 'package:flutter/material.dart';

class ProdDetails extends StatefulWidget {
  final prod_detail_name;
  final prod_detail_new_price;
  final prod_detail_old_price;
  final prod_detail_picture;

  const ProdDetails(
      {super.key,
      required this.prod_detail_name,
      required this.prod_detail_new_price,
      required this.prod_detail_old_price,
      required this.prod_detail_picture});

  @override
  State<ProdDetails> createState() => _ProdDetailsState();
}

class _ProdDetailsState extends State<ProdDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.red,
        title: Text('Fashion Shop'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
                child: Container(
              color: Colors.white,
              child: Image.asset(widget.prod_detail_picture),
            )),
          )
        ],
      ),
    );
  }
}
