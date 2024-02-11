import 'package:ecomm/logic/cubit/user_cubit.dart';
import 'package:ecomm/logic/cubit/user_state.dart';
import 'package:ecomm/presentation/auth/provider/login_provider.dart';
import 'package:ecomm/presentation/auth/signUp_screen.dart';
import 'package:ecomm/presentation/home/home_screen.dart';
import 'package:ecomm/presentation/splash/splash_screen.dart';
import 'package:ecomm/presentation/widget/gap_widget.dart';
import 'package:ecomm/presentation/widget/linktext_widget.dart';
import 'package:ecomm/presentation/widget/primary_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  //iss ye asani rahegi ki string yad rakhne ki zarurat nai padegi
  //use karne keliye just LoginScreen.routeName use krlo
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        //this BlocListener will keep listening to changes in the bloc in realtime
        //we can implement a logic for a bloc change
        //like going to homescreen after user logged in
        //for the loginscreen we created the Bloclistener
        //but do we need it for signup page-->NO
        //because after navigating to signup page the login page is still open in the stack
        //so BlocListener is still active in the background and listening to bloc changes
        if(state is UserLoggedInState){
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
          //lekin abhi bhi piche ke sare screen khule honge stack me..
          //hme homescreen pe sare screen ko udake jana h so
          // Navigator.popUntil(context, (route) => route.isFirst);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ecommerce App'),
        ),
        body: SafeArea(
          child: Form(
            key: provider.formKey,
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                Text(
                  'LogIn',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                (provider.error != "")
                    ? Text(
                        provider.error,
                        style: TextStyle(color: Colors.red),
                      )
                    : SizedBox(),
                GapWidget(),
                PrimaryTextField(
                  labelText: "Email",
                  controller: provider.emailController,
                  validator: (value) {
                    if(value==null|| value.trim() ==""){
                      return "Email address is required";
                    }
                    if(!EmailValidator.validate(value)){
                      return "Invalid email address";
                    }
      
                  },
                ),
                GapWidget(),
                PrimaryTextField(
                  labelText: "Password",
                  controller: provider.passwordController,
                  obscureText: true,
                ),
                GapWidget(),
                CupertinoButton(
                    child: Text((provider.isLoading) ? '...' : 'LogIn'),
                    color: Colors.blue,
                    onPressed: provider.login),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account? ',
                      style: TextStyle(fontSize: 16),
                    ),
                    LinkButton(
                      text: 'SignUp',
                      onPressed: (){
                        Navigator.pushNamed(context, SignUpScreen.routeName);
      
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
