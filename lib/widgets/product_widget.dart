import 'package:e_commerce_starter/providers/shoes_provider.dart';
import 'package:e_commerce_starter/screens/product_page.dart';
import 'package:e_commerce_starter/models/product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {

  //Constructor
  final Product product;
  final bool hasMargin;

  ProductWidget({@required this.product,@required this.hasMargin});

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider
    final provider = Provider.of<StoreProvider>(context,listen: false);

    return GestureDetector(
      onTap: (){
        provider.selectedProduct = product;
        Navigator.of(context).pushNamed(ProductPage.routeName);
      },
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(360),
        margin: EdgeInsets.only(
          top: hasMargin? ScreenUtil().setHeight(90):0,
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
                  fit: StackFit.expand,
                  children: [
                    product.discount!=0? Text("-${product.discount}% Off"):SizedBox(),
                    Hero(tag: product.name,child: Image.asset(product.imageURL)),
                  ],
                )
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(8),),
            Text(product.name,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.normal,fontSize: 18),),
            SizedBox(height: ScreenUtil().setHeight(4),),
            Text("\$${product.price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
