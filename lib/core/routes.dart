import 'package:ecomm/presentation/auth/provider/login_provider.dart';
import 'package:ecomm/presentation/auth/signIn_screen.dart';
import 'package:ecomm/presentation/auth/signUp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//hm generated routes ka use karenge kyuki usse kam code structered dikhta h
//route name screen me define krlo aur usko yaha import karke use kro
//isse strings yad karne ki zarurat nai padegi
class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignUpScreen.routeName:
        return CupertinoPageRoute(builder: (context) => SignUpScreen());
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
              //loginprovider ko loginscreen ka context milgya... ab bloc istemal kar sakenge
                  create: (context) => LoginProvider(context),
                  child: LoginScreen(),
                ));
      default:
        return null;
    }
  }
}
