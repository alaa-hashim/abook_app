import 'package:google_fonts/google_fonts.dart';

import 'detailes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Cart.dart';
import '../classes/items.dart';
class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Color(0xff0000ff),
        title: Center(child: Text("Checkout")),
      ),
      body: Consumer<Cart>(builder: (context , Cart , child){
        return Cart.basketitem.isEmpty  ? Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset('assets/emcart.jpg'),
            Text('Your cart is  empty ' ,style:GoogleFonts.cairo
              (textStyle : TextStyle(
            color: Color(0xff343434),
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),)),
          ],
        )) : Column(
          children: [
            Expanded(
              child:  ListView.builder(
                itemCount: Cart.basketitem.length,
                itemBuilder:(context , index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push( context,MaterialPageRoute(builder: (context){
                        return Detailes(item : items[index]);
                      }));
                    },
                    child: Center(
                      child:  Card(
                        child: ListTile(
                          leading:Container(
                            height: 80,
                            width: 70,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(items[index].image),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          title: Text(Cart.basketitem[index].name),
                          subtitle:Text(items[index].description) ,
                          trailing: IconButton(icon: Icon(Icons.restore_from_trash_rounded), onPressed: (){
                            Cart.reomve(Cart.basketitem[index]);
                          },),
                        ),
                      ),
                    )
                  );
                }
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(bottom:28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0000ff) ,
                    ),
                    height: 40,
                    width: 340 ,
                    child: Center(
                      child: Text('BUY  ${Cart.basketitem.length.toString()} '
                          'ITEMS FOR  AED ${Cart.totalprice.toString()}'
                          ' ${Cart.basketitem.length.toString()} '
                          ,style:TextStyle(
                            fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                    ),
                  ),

                ],
              ),
            ),
          ],
        );

      },),
    );
  }
}
