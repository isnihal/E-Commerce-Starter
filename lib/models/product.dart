import 'package:flutter/cupertino.dart';

class Product{
  String name,brand,imageURL,description;
  double price;
  int discount;

  Product({this.name,this.description,this.brand,this.imageURL,this.price,this.discount});
}