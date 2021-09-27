import 'package:from_ui_app/classes/iphone.dart';
import 'package:from_ui_app/classes/proudacts.dart';

class Category {

  String name;
  String image ;
  double price ;
  List<Proudact> proudacts;
  List<Iphone> iphones;
  List<Proudact> sonys ;






  Category({
    this.image,
    this.name,
    this.price,
    this.proudacts ,
    this.iphones ,
    this.sonys

  });
}
List<Category> categories = [
  Category(
    proudacts : sonys ,
    image: 'assets/categories/we.jpg',
    name: 'womens fashion ',

  ),
  Category(
    iphones: iphones ,
    image: 'assets/categories/back.jpg',
    name: 'school',

  ),
  Category(
    iphones: iphones ,
    image: 'assets/categories/gam.jpg',
    name: 'Gaming',

  ),
  Category(
    sonys: sonys ,
    image: 'assets/categories/lap.jpg',
    name: 'laptops',

  ),
  Category(
    iphones: iphones ,
    image: 'assets/categories/man.jpg',
    name: 'men fashion ',

  ),
  Category(
    proudacts: proudacts ,
    image: 'assets/categories/bea.jpg',
    name: 'Beauty',
  ),
  Category(
    proudacts: proudacts ,
    image: 'assets/categories/phone.jpg',
    name: 'phones',
  ),
  Category(
    proudacts: proudacts ,
    image: 'assets/categories/Sports.jpg',
    name: 'Sports',
  ),


];