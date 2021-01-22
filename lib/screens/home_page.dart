import 'package:e_commerce_starter/models/product.dart';
import 'package:e_commerce_starter/providers/store_provider.dart';
import 'package:e_commerce_starter/screens/cart_screen.dart';
import 'package:e_commerce_starter/screens/search_screen.dart';
import 'package:e_commerce_starter/screens/wishlist_screen.dart';
import 'package:e_commerce_starter/utils/border_paint.dart';
import 'package:e_commerce_starter/widgets/product_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomePage extends StatefulWidget {

  static String routeName = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //  Current State of InnerDrawerState
  final GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();

  //Control variables
  int _currentSelectedDrawerButtonIndex = 0;

  List<Widget> _createDrawerButtons(){
    List _drawerButtonTexts = ["Home","Wishlist"];
    List<FlatButton> _drawerButtons = [];
    for(int i=0;i<_drawerButtonTexts.length;i++) {
      if (i == _currentSelectedDrawerButtonIndex) {
        FlatButton flatButton = FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Align(alignment:Alignment.centerLeft,child: Text(_drawerButtonTexts[i],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),textAlign: TextAlign.left,)),
            onPressed: (){
              setState(() {
                _currentSelectedDrawerButtonIndex = i;
                Navigator.of(context).pop();
              });
            }
        );
        _drawerButtons.add(flatButton);
      }
      else{
        FlatButton flatButton = FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(alignment:Alignment.centerLeft,child: Text(_drawerButtonTexts[i],style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16,),textAlign: TextAlign.left,)),
          onPressed: (){
            setState(() {
              _currentSelectedDrawerButtonIndex = i;
              Navigator.of(context).pop();
            });
          },
        );
        _drawerButtons.add(flatButton);
      }
    }
    return _drawerButtons;
  }

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider data
    var provider = Provider.of<StoreProvider>(context);
    List<Product> _products = provider.filteredProducts;
    var _selectedBrands = provider.selectedBrands;

    //Alert dialog function
    _showAlertDialog(BuildContext context) {

      // Show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context,setState){
              return  AlertDialog(
                contentPadding: EdgeInsets.zero,
                title: Text("Select Brands",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600),),
                content: Container(
                  height: ScreenUtil().setHeight(260),
                  width: ScreenUtil().setWidth(120),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          title: Text("Brand I"),
                          activeColor: Colors.black87,
                          value: _selectedBrands[0],
                          onChanged: (newValue) {
                            setState(() {
                              provider.selectedBrands[0] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Brand II"),
                          activeColor: Colors.black87,
                          value: _selectedBrands[1],
                          onChanged: (newValue) {
                            setState(() {
                              provider.selectedBrands[1] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Brand III"),
                          activeColor: Colors.black87,
                          value: _selectedBrands[2],
                          onChanged: (newValue) {
                            setState(() {
                              provider.selectedBrands[2] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Brand IV"),
                          activeColor: Colors.black87,
                          value: _selectedBrands[3],
                          onChanged: (newValue) {
                            setState(() {
                              provider.selectedBrands[3] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  FlatButton(
                    child: Text("Done",style: TextStyle(color: Colors.black87),),
                    onPressed: () {
                      setState(() {
                        provider.filterProducts();
                        Navigator.of(context).pop();
                      });
                    },
                  ),
              ],
              );
            }
          );
        },
      );
    }

    //Drawer function
    void _toggle() {
      _innerDrawerKey.currentState.toggle(
      );
    }

    return InnerDrawer(
      key: _innerDrawerKey,
      boxShadow: [BoxShadow(color: Colors.transparent)],
      colorTransitionChild: Colors.white,
      borderRadius: 50,
      // default 0
      leftAnimationType: InnerDrawerAnimation.static,
      // default static
      rightAnimationType: InnerDrawerAnimation.quadratic,
      colorTransitionScaffold: Colors.white,
      innerDrawerCallback: (a) => print(a),
      offset: IDOffset.only(bottom: 0.05),
      proportionalChildArea: true,
      scale: IDOffset.horizontal(0.7),
      rightChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _createDrawerButtons()
      ),
      scaffold: _currentSelectedDrawerButtonIndex == 0? SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(32)
            ),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(24),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.menu),
                    onPressed: _toggle,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(32),
                ),
                Row(
                  children: [
                    Text(
                      "Choose",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 26,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(8),),
                    Text(
                      "Product",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 26,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(32),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: ScreenUtil().setHeight(64),
                          width: ScreenUtil().setWidth(64),
                          child: MaterialButton(
                            color: Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            onPressed: (){
                              Navigator.of(context).pushNamed(SearchScreen.routeName);
                            },
                            child: Center(
                              child: Icon(Icons.search),
                            ),
                          ),

                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(64),
                          width: ScreenUtil().setWidth(64),
                          child: MaterialButton(
                            color: Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            onPressed: (){
                              _showAlertDialog(context);
                            },
                            child: Center(
                              child: Icon(Icons.filter_alt_outlined),
                            ),
                          ),

                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(16),
                        ),
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
                                child: CustomPaint(painter: BorderPainter(),child: Center(child: Text("${provider.cart.length}",style: TextStyle(color: Colors.white),))),
                              )
                            ],
                          )
                        ),
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(32),
                ),
                Expanded(
                  child: WaterfallFlow.builder(
                    itemCount: _products.length,
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: ScreenUtil().setHeight(30),
                      crossAxisSpacing: ScreenUtil().setWidth(30),
                    ),
                    itemBuilder: (ctx,index){
                      if(index==1)
                        return ProductWidget(product: _products[index], hasMargin: true);
                      else
                        return ProductWidget(product: _products[index], hasMargin: false);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ):WishListScreen(_toggle),
    );
  }
}
