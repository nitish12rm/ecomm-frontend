import 'dart:async';

import 'package:ecomm/logic/cubit/user_cubit.dart';
import 'package:ecomm/logic/cubit/user_state.dart';
import 'package:ecomm/presentation/auth/signIn_screen.dart';
import 'package:ecomm/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
static const String routeName = 'SplashScreen' ;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goToNextScreen(){
    UserState userState = BlocProvider.of<UserCubit>(context).state;
    if(userState is UserLoggedInState){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
    else if(userState is UserErrorState){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
    if(userState is UserLoggedOutState){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 100), () {
      _goToNextScreen();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        _goToNextScreen();
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
