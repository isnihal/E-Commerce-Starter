import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/product.dart';

import 'package:e_commerce_starter/values.dart' as values;

class StoreProvider with ChangeNotifier{

  //####Section#### {Inventory functions}

  List<Product> _products = [
    //TODO: This should be empty when fetching data from the API
    Product(
        name: "Product I",
        brand: "Brand I",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Product II",
        brand: "Brand II",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Product III",
        brand: "Brand III",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Product IV",
        brand: "Brand IV",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
  ];

  //This is a secure approach to retrieve the product inventory
  List<Product> get products{
    return [..._products];
  }

  //####Section#### {Network functions}
  static String _baseUrl = values.BASE_URL;


  ////####Section#### {Cart Management Functions}

  List<Product> _cart = [];
  List<Product> get cart{
    return[..._cart];
  }

  List<Product> _wishlist  = [];
  List<Product> get wishlist{
    return[..._wishlist];
  }

  void addToCart(Product product){
    if(!_cart.contains(product)) _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void addToWishList(Product product){
    _wishlist.add(product);
  }

  void removeFromWishList(Product product){
    _wishlist.remove(product);
    notifyListeners();
  }

  bool isProductInCart(Product product){

    //Check if a product is present in a cart

    for(int i=0;i<_cart.length;i++){
      Product obj = _cart[i];
      if(product.id == obj.name){
        return true;
      }
    }
    return false;
  }

  bool isProductInWishlist(Product product){

    //Check if a product is present in the wishlist

    for(int i=0;i<_wishlist.length;i++){
      Product obj = _wishlist[i];
      if(product.name == obj.name){
        return true;
      }
    }
    return false;
  }

  ////####Section#### {Accounting Functions}

  double get totalSum {

    //Get the sum of prices of all products

    if (_cart.isEmpty)
      return 0;
    else {
      double sum = 0;
      _cart.forEach((product) {
        sum += product.price;
      });
      return sum;
    }
  }

  double get shippingFee{

    //Define shipping fee in this function

    if(_cart.isEmpty) return 0;
    else return totalSum * values.SHIPPING_FEE;
  }

  double get tax{

    //Calculate taxes in this function

    if(_cart.isEmpty) return 0;
    else return totalSum  * values.TAXES;
  }

  double get totalAmount{

    //Get the total price including taxes and shipping fee

    if(_cart.isEmpty) return 0;
    else return totalSum+tax+shippingFee;
  }

  //####Section#### {UI Functions}

  Product selectedProduct;

  //If brand/category filters of product is involved
  var selectedBrands = [true,true,true,true];

  List<Product> _filteredProducts = [
    //TODO: This should be empty when fetching data from the API
    Product(
        name: "Product I",
        brand: "Brand I",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Product II",
        brand: "Brand II",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Product III",
        brand: "Brand III",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Product IV",
        brand: "Brand IV",
        imageURL: "assets/images/nike1.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
  ];

  List<Product> get filteredProducts {
    return [..._filteredProducts];
  }

  void filterProducts(){
    //Function to filter products

    _filteredProducts.clear();
    _products.forEach((item) {

      if(selectedBrands[0] && item.brand=="Brand I") _filteredProducts.add(item);
      else if(selectedBrands[1] && item.brand=="Brand II") _filteredProducts.add(item);
      else if(selectedBrands[2] && item.brand=="Brand III") _filteredProducts.add(item);
      else if(selectedBrands[3] && item.brand=="Brand IV") _filteredProducts.add(item);

    });
    notifyListeners();
  }

}