import 'package:e_commerce_starter/models/product.dart';
import 'package:e_commerce_starter/providers/shoes_provider.dart';
import 'package:e_commerce_starter/widgets/shoe_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class SearchScreen extends StatefulWidget {

  static const routeName = "/search_screen";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  //Animation params
  double _width = ScreenUtil().setWidth(84);
  bool _isVisible = false;
  bool _isSearching = false;

  //Object declerations
  List<Shoe> _selectedShoes;

  @override
  void initState() {

    //Initial search result is empty
    _selectedShoes = [];

    //Animation handler
    Future.delayed(Duration.zero,(){
      setState(() {
        _width = ScreenUtil.defaultSize.width;
      });
    });

    Future.delayed(Duration(milliseconds: 700),(){
      setState(() {
        _isVisible = true;
      });
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    //ScreenUtil
    ScreenUtil.init(
        context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider data
    var provider = Provider.of<ShoeProvider>(context);
    List<Shoe> _shoes = provider.shoes;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 16,
                          left: 8,
                          right: 8,
                          bottom: 16
                      ),
                    ),
                    Expanded(
                        child: _isSearching? Padding( padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(8),
                          right: ScreenUtil().setWidth(8),
                        ),
                          child: _selectedShoes.length==0? Container(
                            color: Theme.of(context).backgroundColor,
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: ScreenUtil().setHeight(32),),
                                  Image.asset("assets/images/empty_cart.png",width: ScreenUtil().setWidth(227),height: ScreenUtil().setHeight(202),),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(64)
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        children: [
                                          Text("Sorry!",style: TextStyle(color: Color(0xFF87879D),fontSize: 24,fontWeight: FontWeight.bold),),
                                          SizedBox(height: ScreenUtil().setHeight(24),),
                                          Text("Product not found!",style: TextStyle(color: Color(0xFF87879D),fontSize: 24,fontWeight: FontWeight.w300),),
                                          SizedBox(height: ScreenUtil().setHeight(72),),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ):
                          WaterfallFlow.builder(
                            itemCount: _selectedShoes.length,
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(24),
                              right: ScreenUtil().setWidth(24),
                              top: ScreenUtil().setHeight(28),
                              bottom: ScreenUtil().setHeight(24),
                            ),
                            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: ScreenUtil().setHeight(60),
                              crossAxisSpacing: ScreenUtil().setWidth(30),
                            ),
                            itemBuilder: (ctx,index){
                              return ShoeWidget(shoe: _selectedShoes[index], hasMargin: false);
                            },
                          ),
                        ):Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(8),
                              right: ScreenUtil().setWidth(8),
                            ),
                        )
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(108),
                    )
                  ],
                ),
                AnimatedContainer(
                  height: ScreenUtil().setHeight(72),
                  width: _width,
                  curve: Curves.linearToEaseOut,
                  duration: Duration(seconds: 3),
                  margin: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(24),
                      horizontal: ScreenUtil().setHeight(48)
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(16),
                      vertical: ScreenUtil().setHeight(8)
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(
                        color: Colors.black87,
                        blurRadius: 1.0,
                      ),]
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search,color: Theme.of(context).primaryColor,size: ScreenUtil().setHeight(32),),
                      SizedBox(width: ScreenUtil().setWidth(8),),
                      Expanded(
                        child: Visibility(
                          visible: _isVisible,
                          child: TextField(
                            onChanged: (value){
                              if(value.length!=0) {
                                if (!_isSearching) {
                                  _isSearching = true;
                                }
                                setState(() {
                                  _selectedShoes.clear();
                                  _selectedShoes.addAll(
                                      _shoes.where((element) =>
                                          element.name.toLowerCase().contains(
                                              value.toLowerCase()) || element.brand.toLowerCase().contains(
                                              value.toLowerCase())
                                      )
                                  );
                                });
                              }
                              else{
                                setState(() {
                                  _isSearching = false;
                                });
                              }
                            },
                            autofocus: true,
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                hintText: 'Search your product',
                                hintStyle: TextStyle(color: Colors.grey[600])
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
