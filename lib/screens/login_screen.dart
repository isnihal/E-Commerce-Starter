import 'package:e_commerce_starter/screens/home_page.dart';
import 'package:e_commerce_starter/screens/sign_up_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';


GlobalKey _signInFormKey;

String _email="",_password="",_confirmPassword="",_phoneNumber="",_altPhoneNumber="",_otp="";

class LoginScreen extends StatefulWidget {

  static const routeName = "/login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
        context, designSize: Size(414, 896), allowFontScaling: true);


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
                    height: ScreenUtil().setHeight(120),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child:  Text("Log In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 44),),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(54),
                  ),
                  LoginForm(),
                  SizedBox(
                    height: ScreenUtil().setHeight(136),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(90),
                        vertical: ScreenUtil().setHeight(16)
                    ),
                    onPressed: (){
                          //TODO:Login Logic
                          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                      },
                      elevation: 8,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)
                      ),
                      child: Text("Log In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 24),),
                      ),
                      SizedBox(
                      height: ScreenUtil().setHeight(16),
                      ),
                      GestureDetector(
                      onTap: ()=>Navigator.of(context).pushNamed(SignUpScreen.routeName),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("First time here? ",style: TextStyle(color: Colors.white),),
                          Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
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


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      _signInFormKey = GlobalKey<FormState>();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Form(
            key: _signInFormKey,
            child: Column(
              children: [
                SizedBox(
                  width:ScreenUtil().setWidth(320),
                  child: TextFormField(
                    onChanged: (value){
                      _email = value;
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: ScreenUtil().setHeight(18)),
                      prefixIcon: Icon(Icons.person,color: Colors.white,),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:  Colors.white,),
                      ),
                      hintText: "Enter email or username",
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
                ),
                SizedBox(
                  width:ScreenUtil().setWidth(320),
                  child: TextFormField(
                    onFieldSubmitted: (value){
                      //TODO:SIGN IN THE USER AFTER SUBMITTING THE FIELD
                    },
                    onChanged: (value){
                      _password = value;
                    },
                    obscureText: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,color: Colors.white,),
                      contentPadding: EdgeInsets.only(top: ScreenUtil().setHeight(18)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEA9B07),),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFEA9B07))),
                      hintText: "Password",
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
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(26),),
        GestureDetector(
          onTap: (){
            debugPrint("Forgot password");
          },
          child: Container(
              child: Align(alignment: Alignment.bottomRight,
                  child: Text("Forgot Password?", style: TextStyle(
                    fontSize: ScreenUtil().setWidth(14),
                    color: Colors.white,),))),
        ),
      ],
    );
  }
}