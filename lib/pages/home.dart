import 'package:card_swiper/card_swiper.dart';
import 'package:fashion_shop/components/horizontal_listview.dart';
import 'package:fashion_shop/components/products.dart';
import 'package:fashion_shop/pages/cart.dart';
import 'package:fashion_shop/pages/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'images/m1.jpeg',
      'images/m2.jpg',
      'images/w1.jpeg',
      'images/w3.jpeg',
      'images/w4.jpeg',
      'images/c1.jpg',
    ];
    Widget swiper = Container(
      height: 200.0,
      child: Swiper(
        itemBuilder: (context, index) {
          final image = list[index];
          return Image.asset(
            image,
            fit: BoxFit.cover,
          );
        },
        indicatorLayout: PageIndicatorLayout.NONE,
        autoplay: false,
        itemCount: list.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );

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
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          swiper,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          //Horizontal list view
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Recent products'),
          ),
//Grid view
          Flexible(child: Products()),
        ],
      ),
      drawer: Profile(),
    );
  }
}
