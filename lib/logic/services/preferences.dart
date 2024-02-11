import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static Future<void> saveUserDetail(String email, String password) async{
    SharedPreferences sharedPreferencesInstance = await SharedPreferences.getInstance();
    await sharedPreferencesInstance.setString("email", email);
    await sharedPreferencesInstance.setString("password", password);
    log('Details saved!');
  }
  static Future<Map<String, dynamic>> getUserDetail() async{
    SharedPreferences sharedPreferencesInstance = await SharedPreferences.getInstance();
    String? email = await sharedPreferencesInstance.getString('email');
    String? password = await sharedPreferencesInstance.getString('password');
    return{
      "email":email,
      "password":password
    };
  }
  static Future<void> clear() async{
    SharedPreferences sharedPreferencesInstance = await SharedPreferences.getInstance();
    await sharedPreferencesInstance.clear();
    log('Details saved!');
  }
}
//hme jo email pass login hone se just pehle save krni h
//this means we have to call the saveUserDetail just before emiting userloggedintsate