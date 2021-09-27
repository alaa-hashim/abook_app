// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:from_ui_app/classes/CAT.dart';
import 'package:from_ui_app/classes/Cart.dart';
import 'package:from_ui_app/classes/proudacts.dart';
import 'package:provider/provider.dart';

class All extends StatelessWidget {
  final Category? category;
  final Proudact? proudact;

  const All({Key? key, this.category, this.proudact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: proudacts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Consumer<Cart>(builder: (context, Cart, child) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffc0d6e4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Container(
                                      height: 140,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image:
                                            AssetImage(proudacts[index].image!),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                  ),
                                  Text(proudacts[index].name!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff0000ff),
                                      )),
                                  Text(proudacts[index].price.toString(),
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff0000ff),
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
