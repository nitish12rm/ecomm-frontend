import 'dart:developer';

import 'package:ecomm/core/routes.dart';
import 'package:ecomm/logic/cubit/user_cubit.dart';
import 'package:ecomm/presentation/auth/signIn_screen.dart';
import 'package:ecomm/presentation/auth/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const EcommApp());
}

class EcommApp extends StatefulWidget {
  const EcommApp({super.key});

  @override
  State<EcommApp> createState() => _EcommAppState();
}

class _EcommAppState extends State<EcommApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
//inla instance sare screens me use hoga
        BlocProvider(create: (context)=>UserCubit()),

      ],
      child: MaterialApp(
          onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: LoginScreen.routeName,

      ),
    );
  }
}
class MyBlocObserver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    log("Created: $bloc");
    super.onCreate(bloc);
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in: $bloc: $change");
    // TODO: implement onChange
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in: $bloc: $transition");
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
  }
  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    // TODO: implement onClose
    super.onClose(bloc);
  }
}


