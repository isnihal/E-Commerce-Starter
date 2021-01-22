import 'package:e_commerce_starter/widgets/intro_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class OnBoardingScreen extends StatefulWidget {

  static const routeName = "/onboarding_screen";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  //Controller
  SwiperController _swiperController = new SwiperController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: NotificationListener(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: Swiper(
                  controller: _swiperController,
                  loop: false,
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: 4,
                  pagination: new SwiperPagination(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      top: 18,
                      left: 18
                    ),
                    builder: SwiperPagination.dots
                  ),
                  itemBuilder: (context, index) {
                    return IntroScreen(
                      index: index,
                      swiperController: _swiperController,
                    );
                  }
              ),
            )
        ),
      ),
    );
  }
}
