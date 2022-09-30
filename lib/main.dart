import 'package:fashion_shop/pages/cart.dart';
import 'package:fashion_shop/pages/home.dart';
import 'package:fashion_shop/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:fashion_shop/components/horizontal_listview.dart';
import 'package:fashion_shop/components/products.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}
