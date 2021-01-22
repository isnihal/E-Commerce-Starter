import 'package:e_commerce_starter/providers/auth_provider.dart';
import 'package:e_commerce_starter/providers/store_provider.dart';
import 'package:e_commerce_starter/screens/cart_screen.dart';
import 'package:e_commerce_starter/screens/home_page.dart';
import 'package:e_commerce_starter/screens/onboarding_screen.dart';
import 'package:e_commerce_starter/screens/product_page.dart';
import 'package:e_commerce_starter/screens/search_screen.dart';
import 'package:e_commerce_starter/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: StoreProvider()),
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: MaterialApp(
        title: 'E commerce starter',
        routes: {
          OnBoardingScreen.routeName: (ctx)=>OnBoardingScreen(),
          HomePage.routeName: (ctx)=>HomePage(),
          ProductPage.routeName: (ctx)=>ProductPage(),
          CartScreen.routeName: (ctx)=>CartScreen(),
          SearchScreen.routeName: (ctx)=>SearchScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}