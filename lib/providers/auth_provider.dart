import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_starter/values.dart' as values;

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier{

  //Object Decelerations
  bool _isUserRegistered = false;
  bool _isUserSignedIn = false;
  bool _isOTPVerified = false;

  bool get isUserRegistered{
    return _isUserRegistered;
  }

  bool get isUserSignedIn{
    return _isUserSignedIn;
  }

  bool get isOTPVerified{
    return _isOTPVerified;
  }

  bool isLoading = false;

  //Load BASE_URL from values
  String _baseUrl = values.BASE_URL;

  Future registerUser(String email,String name,String password,String confirmPassword,
      String phoneNumber,String altPhoneNumber,) {

    isLoading = true;
    notifyListeners();

    final url = _baseUrl + "/authProvider/register";

    return http.post(url,body: {
      'confirmpassword' : confirmPassword,
      'email' : email,
      'name' : name,
      'password': password,
      'phone1' : phoneNumber,
      'phone2' : altPhoneNumber
    }).then((response) {

      print("Registering user");
      print(response.body.toString());

      var decodedResponse = json.decode(response.body.toString()) as Map<
          String,
          dynamic>;

      int status = decodedResponse['status'];

      if(status==200){
        print("Registration successful");
        _isUserRegistered = true;
      }

      isLoading = false;
      notifyListeners();
    });
  }

  Future logInUser(String email,String password) {

    isLoading = true;
    notifyListeners();

    final url = _baseUrl + "/authProvider/login";

    return http.post(url,body: {
      'email' : email,
      'password': password,
    }).then((response) {

      var decodedResponse = json.decode(response.body.toString()) as Map<
          String,
          dynamic>;

      int status = decodedResponse['status'];

      print("Sign In user");
      print(response.body.toString());

      if(status==200){
        print("Sign in successful");
        _isUserSignedIn = true;
      }

      isLoading = false;
      notifyListeners();
    });
  }

  Future verifyOTP(String email,String otp) {
    isLoading = true;
    notifyListeners();

    final url = _baseUrl + "/authProvider/verify/OTP";

    return http.post(url, body: {
      'emailId': email,
      'password': otp,
    }).then((response) {
      var decodedResponse = json.decode(response.body.toString()) as Map<
          String,
          dynamic>;

      int status = decodedResponse['status'];

      print("Verify OTP");
      print(response.body.toString());

      if (status == 200) {
        print("OTP Verify successful");
        _isOTPVerified = true;
      }

      isLoading = false;
      notifyListeners();
    });
  }
}