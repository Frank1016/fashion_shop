import 'package:fashion_shop/pages/prod_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old price': 120,
      'price': 85,
    },
    {
      'name': 'Red dress',
      'picture': 'images/products/dress1.jpeg',
      'old price': 100,
      'price': 50,
    },
    {
      'name': 'Hills',
      'picture': 'images/products/hills1.jpeg',
      'old price': 130,
      'price': 59,
    },
    {
      'name': 'Pants',
      'picture': 'images/products/pants1.jpg',
      'old price': 180,
      'price': 90,
    },
    {
      'name': 'Shoe',
      'picture': 'images/products/shoe1.jpg',
      'old price': 200,
      'price': 80,
    },
    {
      'name': 'Skirt',
      'picture': 'images/products/skt1.jpeg',
      'old price': 100,
      'price': 60,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleProd(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old price'],
              prod_price: product_list[index]['price']),
        );
      }),
    );
  }
}

class SingleProd extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  const SingleProd(
      {super.key,
      required this.prod_name,
      required this.prod_picture,
      required this.prod_old_price,
      required this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProdDetails(
                        prod_detail_name: prod_name,
                        prod_detail_new_price: prod_price,
                        prod_detail_old_price: prod_old_price,
                        prod_detail_picture: prod_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            prod_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          )),
                          Text(
                            '\$$prod_price',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
