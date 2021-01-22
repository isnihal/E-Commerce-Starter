import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class StoreProvider with ChangeNotifier{

  //####Section#### {UI Functions}
  Product selectedProduct;
  
  //If brand/category filters of product is involved
  var selectedBrands = [true,true,true,true];

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

  //Inventory
  List<Product> _products = [
    Product(
        name: "Pegasus 30",
        brand: "Nike",
        imageURL: "assets/images/nike1.png",
        price: 345,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Air Force",
        brand: "Nike",
        //colors: [//colors.black,//colors.green],
        imageURL: "assets/images/nike2.png",
        price: 499,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Air Zoom",
        brand: "Nike",
        //colors: [//colors.grey,//colors.black],
        imageURL: "assets/images/nike3.png",
        price: 300,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Air Max",
        brand: "Nike",
        //colors: [//colors.white,//colors.red],
        imageURL: "assets/images/nike4.png",
        price: 345,
        discount: 5,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Air Jordan Max",
        brand: "Nike",
        //colors: [//colors.white12,//colors.indigo],
        imageURL: "assets/images/nike5.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Ultraboost",
        brand: "Adidas",
        //colors: [//colors.pink[50],//colors.black],
        imageURL: "assets/images/adidas1.png",
        price: 645,
        discount: 4,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Adizero",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.red],
        imageURL: "assets/images/adidas2.png",
        price: 199,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Bounce I",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.orange],
        imageURL: "assets/images/adidas3.png",
        price: 200,
        discount: 30,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Solar Drive",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.pink],
        imageURL: "assets/images/adidas4.png",
        price: 315,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Superstar",
        brand: "Adidas",
        //colors: [//colors.black,//colors.blueAccent],
        imageURL: "assets/images/adidas5.png",
        price: 399,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "990 v4",
        brand: "New Balance",
        //colors: [//colors.grey[200],//colors.grey],
        imageURL: "assets/images/nb1.png",
        price: 199,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "1080 v6",
        brand: "New Balance",
        //colors: [//colors.red,//colors.lightBlueAccent],
        imageURL: "assets/images/nb2.png",
        price: 500,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Ultra Road",
        brand: "Skechers",
        //colors: [//colors.black,//colors.red],
        imageURL: "assets/images/skechers1.png",
        price: 300,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Razor 3",
        brand: "Skechers",
        //colors: [//colors.lightBlueAccent,//colors.pink],
        imageURL: "assets/images/skechers2.png",
        price: 269,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),

  ];

  //This is a secure approach to retrieve the product inventory
  List<Product> get products{
    return [..._products];
  }

  List<Product> _filteredProducts = [

    Product(
        name: "Pegasus 30",
        brand: "Nike",
        imageURL: "assets/images/nike1.png",
        price: 345,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Air Force",
        brand: "Nike",
        //colors: [//colors.black,//colors.green],
        imageURL: "assets/images/nike2.png",
        price: 499,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Air Zoom",
        brand: "Nike",
        //colors: [//colors.grey,//colors.black],
        imageURL: "assets/images/nike3.png",
        price: 300,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Product(
        name: "Air Max",
        brand: "Nike",
        //colors: [//colors.white,//colors.red],
        imageURL: "assets/images/nike4.png",
        price: 345,
        discount: 5,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Air Jordan Max",
        brand: "Nike",
        //colors: [//colors.white12,//colors.indigo],
        imageURL: "assets/images/nike5.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Ultraboost",
        brand: "Adidas",
        //colors: [//colors.pink[50],//colors.black],
        imageURL: "assets/images/adidas1.png",
        price: 645,
        discount: 4,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Adizero",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.red],
        imageURL: "assets/images/adidas2.png",
        price: 199,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Bounce I",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.orange],
        imageURL: "assets/images/adidas3.png",
        price: 200,
        discount: 30,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Solar Drive",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.pink],
        imageURL: "assets/images/adidas4.png",
        price: 315,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Superstar",
        brand: "Adidas",
        //colors: [//colors.black,//colors.blueAccent],
        imageURL: "assets/images/adidas5.png",
        price: 399,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "990 v4",
        brand: "New Balance",
        //colors: [//colors.grey[200],//colors.grey],
        imageURL: "assets/images/nb1.png",
        price: 199,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "1080 v6",
        brand: "New Balance",
        //colors: [//colors.red,//colors.lightBlueAccent],
        imageURL: "assets/images/nb2.png",
        price: 500,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Ultra Road",
        brand: "Skechers",
        //colors: [//colors.black,//colors.red],
        imageURL: "assets/images/skechers1.png",
        price: 300,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Product(
        name: "Razor 3",
        brand: "Skechers",
        //colors: [//colors.lightBlueAccent,//colors.pink],
        imageURL: "assets/images/skechers2.png",
        price: 269,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
  ];

  List<Product> get filteredProducts {
    return [..._filteredProducts];
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

    //TODO: Access shipping fee from a file

    if(_cart.isEmpty) return 0;
    else return  _cart.length*4.5;
  }

  double get tax{

    //TODO: Get tax from a file

    if(_cart.isEmpty) return 0;
    else return totalSum  * 0.15;
  }

  double get totalAmount{

    //Get the total price including taxes and shipping fee

    if(_cart.isEmpty) return 0;
    else return totalSum+tax+shippingFee;
  }

  ////####Section#### {Cart Managment Functions}
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
    //TODO:CHANGE TO ID

    for(int i=0;i<_cart.length;i++){
      Product obj = _cart[i];
      if(product.name == obj.name){
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
}