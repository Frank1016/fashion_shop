import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
              image_caption: 'shirt', image_location: 'images/cats/tshirt.png'),
          Category(
              image_caption: 'dress', image_location: 'images/cats/dress.png'),
          Category(
              image_caption: 'pants', image_location: 'images/cats/jeans.png'),
          Category(
              image_caption: 'formal',
              image_location: 'images/cats/formal.png'),
          Category(
              image_caption: 'informal',
              image_location: 'images/cats/informal.png'),
          Category(
              image_caption: 'shoe', image_location: 'images/cats/shoe.png'),
          Category(
              image_caption: 'accessory',
              image_location: 'images/cats/accessories.png'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  const Category(
      {super.key, required this.image_caption, required this.image_location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: Column(
            children: [
              Image.asset(
                image_location,
                width: 100.0,
                height: 60.0,
              ),
              Text(image_caption)
            ],
          ),
        ),
      ),
    );
  }
}
