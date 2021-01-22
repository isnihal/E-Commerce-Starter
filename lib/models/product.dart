import 'package:flutter/cupertino.dart';

class Product{
  String id,name,brand,imageURL,description;
  double price;
  int discount;

  Product({this.id,this.name,this.description,this.brand,this.imageURL,this.price,this.discount});
}