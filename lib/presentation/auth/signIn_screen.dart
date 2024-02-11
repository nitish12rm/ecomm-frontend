import 'package:ecomm/presentation/auth/provider/login_provider.dart';
import 'package:ecomm/presentation/widget/gap_widget.dart';
import 'package:ecomm/presentation/widget/linktext_widget.dart';
import 'package:ecomm/presentation/widget/primary_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('Ecommerce App'),),
      body: SafeArea(
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
            (provider.error!="")?Text(provider.error,style: TextStyle(color: Colors.red),) : SizedBox(),
            GapWidget(),
            PrimaryTextField(labelText: "Email",controller: provider.emailController,),
            GapWidget(),
            PrimaryTextField(labelText: "Password",controller: provider.passwordController,obscureText: true,),
            GapWidget(),
            CupertinoButton(child: Text((provider.isLoading)?'...':'LogIn'), color: Colors.blue,onPressed: provider.login),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Dont have an account? ',style: TextStyle(fontSize: 16),),
                LinkButton(text: 'SignUp',)
              ],
            )
          ],
        ),
      ),
    );
  }
}
