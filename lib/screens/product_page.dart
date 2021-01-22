import 'package:e_commerce_starter/models/product.dart';
import 'package:e_commerce_starter/providers/shoes_provider.dart';
import 'package:e_commerce_starter/screens/cart_screen.dart';
import 'package:e_commerce_starter/utils/border_paint.dart';

import 'package:flutter/material.dart';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {

  static String routeName = "/product_page";

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  //Keys and controllers
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider data
    var provider = Provider.of<StoreProvider>(context,listen: false);
    Product product = provider.selectedProduct;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(75),
                  bottomLeft:  Radius.circular(75)
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(32),
                      left: ScreenUtil().setWidth(32),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(Icons.keyboard_arrow_left,size: ScreenUtil().setWidth(32)),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: provider.isProductInWishlist(product)? Icon(Icons.favorite):Icon(Icons.favorite_border),
                            onPressed: (){
                              setState(() {
                                if(provider.isProductInWishlist(product)) provider.removeFromWishList(product);
                                else provider.addToWishList(product);
                              });
                            },
                          )
                        ],
                      ),
                      Hero(
                          tag: product.name,
                          child: Image.asset(
                            product.imageURL,
                            height: ScreenUtil().setHeight(414),
                            width: ScreenUtil().setWidth(414),)
                      ),
                      SizedBox(height: ScreenUtil().setHeight(32),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: ScreenUtil().setHeight(8),),
                              Text(product.name,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.normal,fontSize: 18),),
                              SizedBox(height: ScreenUtil().setHeight(4),),
                              Text("\$${product.price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            ],
                          ),
                          Container(
                            height: ScreenUtil().setHeight(64),
                            width: ScreenUtil().setWidth(148),
                            child: MaterialButton(
                              color: Colors.black,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              onPressed: (){
                                //provider.addToCart(shoe);
                                Navigator.of(context).pushNamed(CartScreen.routeName);
                              },
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Cart",style: TextStyle(color: Colors.white),),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: CustomPaint(
                                          painter: BorderPainter(),
                                          child: Center(
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: BoxConstraints(),
                                              icon: Icon(Icons.add,color: Colors.white,),
                                              onPressed: (){
                                                if(!provider.isProductInCart(product)){
                                                  provider.addToCart(product);
                                                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                                                    content: Text("Item added to cart"),
                                                    duration: Duration(seconds: 1),
                                                    action: SnackBarAction(
                                                      label: "Remove Item",
                                                      onPressed: (){
                                                       _scaffoldKey.currentState.removeCurrentSnackBar();
                                                        provider.removeFromCart(product);
                                                      },
                                                    ),
                                                  ));
                                                }
                                                else{
                                                 _scaffoldKey.currentState.showSnackBar(SnackBar(
                                                    content: Text("Item already in cart"),
                                                    duration: Duration(seconds: 1),
                                                    action: SnackBarAction(
                                                      label: "Dismiss",
                                                      onPressed: (){
                                                        _scaffoldKey.currentState.removeCurrentSnackBar();
                                                      },
                                                    ),
                                                  ));
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),

                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(16),),
                      Expanded(
                        flex: 1,
                        child: FadingEdgeScrollView.fromSingleChildScrollView(
                          gradientFractionOnStart: 0.9,
                          gradientFractionOnEnd: 0.9,
                          child: SingleChildScrollView(
                            controller:  _scrollController,
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.description,overflow: TextOverflow.fade,),
                                SizedBox(height: ScreenUtil().setHeight(42),)
                              ],
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onVerticalDragEnd: (_){
                if(!provider.isProductInCart(product)) {
                  provider.addToCart(product);
                }
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              child: Stack(
                overflow: Overflow.clip,
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(110),
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(32)
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(26)
                        ),
                        child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -ScreenUtil().setHeight(35),
                    child: Container(
                      height: ScreenUtil().setHeight(75),
                      width: ScreenUtil().setHeight(75),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45)
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(8)),
                          child: Icon(Icons.keyboard_arrow_up),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        )
      ),
    );
  }
}
