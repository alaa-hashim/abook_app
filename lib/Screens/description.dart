
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_ui_app/Widgets/Sreachdelegate.dart';
import 'package:from_ui_app/classes/Cart.dart';
import 'package:provider/provider.dart';

import 'checkout.dart';
import '../classes/items.dart';


class Description extends StatefulWidget {
  final  Item item ;

  const Description({Key key, this.item}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Sreachdelegate();
              }));
            },),
            Stack(
              children: [
                IconButton(icon: Icon(Icons.add_shopping_cart_outlined), onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Checkout();
                  }));
                },),
                Consumer<Cart>(builder: (context , Cart ,child){
                  return Text("${Cart.count}");
                },),
              ],
            )

          ],

        ),
      body: ListView(
        children:[Container(
          child: Column(
            children: [


            ],
          ),
        ),
      ])
    );
  }
}

