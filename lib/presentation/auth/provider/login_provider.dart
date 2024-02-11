import 'dart:async';
import 'dart:developer';

import 'package:ecomm/logic/cubit/user_cubit.dart';
import 'package:ecomm/logic/cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//ye puri app ke liye nai hai, ye sirf loginscreen ke liye hai
//so hm routes me jake login screen me changenotifier wrap krdenge
class LoginProvider with ChangeNotifier{

  //bloc ko provider me use krne ke liye hm iss class ke instance create hote he uss screen ka context lelenge jisse
  //uss screen ka context miljayega
  BuildContext context;
  LoginProvider(this.context){
    _ListenToCubit();
  }
  bool isLoading = false;
  String error = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //this will help in validating the form
  final formKey = GlobalKey<FormState>();
   StreamSubscription? _userSubscription;

  void  login () async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    BlocProvider.of<UserCubit>(context).signIn(email: email, password: password);
    //abhi bhi half baked hai ye.. signin hone ke bad kya state milra h. iska toh hme abi kuch pata chal nai ra.
    //so hme usercubit ke state changes ko listen karna hoga. uske changes ko dekhna hogda


  }

  void _ListenToCubit(){
    //ye object ke create hote he it should listen to state so call it in the constructor
    log("listening to user state....");
    _userSubscription = BlocProvider.of<UserCubit>(context).stream.listen((userState) {
      if(userState is UserLoadingState){
        isLoading = true;
        error = "";
        notifyListeners();
      }
      else if(userState is UserErrorState){
        isLoading = false;
        error = userState.message;
        notifyListeners();
      }
      else{
        isLoading = false;
        error = "";
        notifyListeners();
      }
    });
    //jabhi streamsubscrion krte h i.e, listen karte use hme close bhi karna hota h
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _userSubscription?.cancel();
    super.dispose();
  }
}

