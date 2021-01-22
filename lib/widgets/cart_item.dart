
import 'package:e_commerce_starter/models/product.dart';
import 'package:e_commerce_starter/providers/store_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class CartItem extends StatelessWidget {

  //Constructor
  final Product product;
  final int cardNum;
  final bool isWishList;

  CartItem({@required this.product,@required this.cardNum,@required this.isWishList});

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider
    final provider = Provider.of<StoreProvider>(context,listen: false);

    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(300),
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setHeight(16),
                    vertical: ScreenUtil().setWidth(16)
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [Colors.grey[100],Colors.grey[300]],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  ),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.expand,
                  children: [
                    Hero(tag: product.name,child: Image.asset(product.imageURL)),
                    Align(
                      alignment: Alignment.topLeft,
                      child:  Padding(
                        padding: EdgeInsets.zero,
                        child: Text(
                          "0${cardNum+1}",
                          style: TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.normal,fontSize: 18),),
                  SizedBox(height: ScreenUtil().setHeight(4),),
                  Text("\$${product.price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    if(!isWishList) provider.removeFromCart(product);
                    else provider.removeFromWishList(product);
                  },
                  icon: Icon(Icons.delete,color: Colors.black,),
                ),
              )
             ],
          )
         ],
      ),
    );
  }
}
