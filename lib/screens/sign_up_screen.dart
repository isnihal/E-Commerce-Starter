import 'package:e_commerce_starter/screens/home_page.dart';
import 'package:e_commerce_starter/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {

  static const routeName = "/sign_up_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

GlobalKey _signUpFormKey;

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
        context, designSize: Size(414, 896), allowFontScaling: true);

    @override
    void initState() {
      _signUpFormKey = GlobalKey<FormState>();
    }

    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(46)
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(90),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child:  Text("New\nAccount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 44),),
                  ),
                  SignUpForm(),
                  SizedBox(
                    height: ScreenUtil().setHeight(48),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(90),
                        vertical: ScreenUtil().setHeight(16)
                    ),
                    onPressed: () {
                      //TODO:SIGN UP LOGIC
                    },
                    elevation: 8,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 24),),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(16),
                  ),
                  GestureDetector(
                      onTap: ()=>Navigator.of(context).pushNamed(LoginScreen.routeName),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",style: TextStyle(color: Colors.white),),
                          Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      _signUpFormKey = GlobalKey<FormState>();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Form(
            key: _signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().setHeight(48),),
                Text("Name",style: TextStyle(color: Colors.white,fontSize: 16,),),
                TextFormField(
                  onChanged: (value){
                    //_email = value;
                  },
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    hintText: "Enter Name",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setWidth(14)
                    ),
                    focusColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email/Username cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(24),),
                Text("Email",style: TextStyle(color: Colors.white,fontSize: 16,),),
                TextFormField(
                  onChanged: (value){
                    //_email = value;
                  },
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    hintText: "Enter email",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setWidth(14)
                    ),
                    focusColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email/Username cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(24),),
                Text("Password",style: TextStyle(color: Colors.white,fontSize: 16,),),
                TextFormField(
                  onChanged: (value){
                    //_password = value;
                  },
                  obscureText: true,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setWidth(14)
                    ),
                    focusColor: Colors.white,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(24),),
                Text("Confirm Password",style: TextStyle(color: Colors.white,fontSize: 16,),),
                TextFormField(
                 onFieldSubmitted: (value){
                   //TODO: Register the user
                   Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                 },
                  onChanged: (value){
                    //_password = value;
                  },
                  obscureText: true,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                    ),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setWidth(14)
                    ),
                    focusColor: Colors.white,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}