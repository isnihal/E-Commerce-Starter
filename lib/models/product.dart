import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{

  //Values which cannot be changed
  final String id,name,brand,imageURL,description;
  final double price;
  final int discount;

  //Values which can be changed
  bool liked;

  void likeProduct(bool like){
    this.liked = like;
    //Reflect the change on the product
    notifyListeners();
  }

  Product({this.id,this.name,this.description,this.brand,this.imageURL,this.price,this.discount,this.liked});
}