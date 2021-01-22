import 'package:e_commerce_starter/models/product.dart';
import 'package:e_commerce_starter/providers/shoes_provider.dart';
import 'package:e_commerce_starter/screens/home_page.dart';
import 'package:e_commerce_starter/widgets/cart_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget{

  //Constructor
  final Function _drawerFunction;

  WishListScreen(this._drawerFunction);

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider data
    var provider = Provider.of<ShoeProvider>(context);
    List<Shoe> products = provider.wishlist;

    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushNamed(HomePage.routeName);
        return null;
      },
      child: SafeArea(
        child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(16)
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(Icons.menu),
                              onPressed: _drawerFunction
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text("Wishlist",style:TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28
                            ) ,),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        child: GridView.builder(
                          itemCount: products.length,
                          padding: EdgeInsets.all(8),
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 24,
                              crossAxisSpacing: 16,
                              childAspectRatio: 2/2.75
                          ),
                          itemBuilder: (ctx,index){
                            return CartItem(cardNum: index,shoe: products[index],isWishList: true,);
                          },

                        )
                    )
                  ]
              ),
            )
        ),
      ),
    );
  }
}
