import 'dart:async';

import 'package:e_commerce_starter/screens/home_page.dart';
import 'package:e_commerce_starter/screens/onboarding_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  static String routeName = "/splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer _splashScreenTimer;

  int _splashScreenDuration = 3;

  void _startSplashScreenTimer() {
    const oneSec = const Duration(seconds: 1);
    _splashScreenTimer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_splashScreenDuration == 0) {
          setState(() {
            loadNextScreen();
            timer.cancel();
          });
        } else {
          setState(() {
            _splashScreenDuration--;
          });
        }
      },
    );
  }

  @override
  void initState(){
    _startSplashScreenTimer();
    super.initState();
  }

  @override
  void dispose() {
    _splashScreenTimer.cancel();
    super.dispose();
  }

  void loadNextScreen() async{
    //Store whether the user was already on-boarded or not
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasOnBoarded = prefs.getBool('onBoarded') ?? false;

    if(!hasOnBoarded) {
      Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName);
      prefs.setBool("onBoarded", true);
    }
    else  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }


  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Image.asset("assets/images/logo.png",width: ScreenUtil().setWidth(172),height: ScreenUtil().setHeight(96)),
      ),
    );
  }
}
