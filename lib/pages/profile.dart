import 'package:flutter/material.dart';

import 'cart.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
//header
          UserAccountsDrawerHeader(
            accountName: Text('Frank Zeng'),
            accountEmail: Text('zengfanjiang@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(
                  'images/profile.jpg',
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
    );
  }
}
