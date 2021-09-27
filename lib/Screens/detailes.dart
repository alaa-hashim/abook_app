// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:from_ui_app/Screens/CarouselSlider.dart';
import 'package:from_ui_app/Screens/checkout.dart';
import 'package:from_ui_app/Widgets/Sreachdelegate.dart';
import 'package:provider/provider.dart';

import '../classes/Cart.dart';
import '../classes/items.dart';

class Detailes extends StatelessWidget {
  final Item? item;
  final List? images;

  const Detailes({
    Key? key,
    this.item,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Sreachdelegate();
                }));
              },
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Checkout();
                    }));
                  },
                ),
                Consumer<Cart>(
                  builder: (context, Cart, child) {
                    return Text("${Cart.count}");
                  },
                ),
              ],
            )
          ],
        ),
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 240,
                    width: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(item!.image!),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Text(item!.description!),
                const Carousel(),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_outlined),
            onPressed: () {
              Provider.of<Cart>(context, listen: false).add(item!);
            },
          ),
        ]));
  }
}
