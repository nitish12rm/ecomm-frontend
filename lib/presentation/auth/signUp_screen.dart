import 'package:ecomm/presentation/auth/provider/signup_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/gap_widget.dart';
import '../widget/linktext_widget.dart';
import '../widget/primary_textfield.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
static const String routeName = 'SignUpScreen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Scaffold(
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
                'Create an Account',
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
                validator: (value) {
                  if(value == null || value.trim()==''){
                    return "Password is required";
                  }

                }
              ),
              GapWidget(),
              PrimaryTextField(
                labelText: "Confirm Password",
                controller: provider.cPasswordController,
                obscureText: true,
                validator: (value){
                  if(value==null||value.trim()==''){
                    return "Required";
                  }
                  if(value.trim()!=provider.passwordController.text.trim()){
                    return "Password do not match";
                  }
                  return null;
                },
              ),
              GapWidget(),
              CupertinoButton(
                  child: Text((provider.isLoading) ? '...' : 'Create'),
                  color: Colors.blue,
                  onPressed: provider.signUp),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  LinkButton(
                    text: 'LogIn',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
