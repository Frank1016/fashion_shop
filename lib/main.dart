import 'package:fashion_shop/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:fashion_shop/components/horizontal_listview.dart';
import 'package:fashion_shop/components/products.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

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

    Widget image_carousel = Container(
      height: 200.0,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlay: false,
        ),
        items: list
            .map((e) => Container(
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                    width: 400.0,
                  ),
                ))
            .toList(),
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
      body: ListView(
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
          Container(height: 320.0, child: Products()),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
//header
            UserAccountsDrawerHeader(
              accountName: Text('Frank Zeng'),
              accountEmail: Text('zengfanjiang@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
//body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
