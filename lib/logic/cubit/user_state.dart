//user ka state kya hosakta h?????
//initial, loading, loggedin, loggedout and error

import 'package:ecomm/data/models/user/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoggedInState extends UserState {
  final UserModel userModel;

  UserLoggedInState(this.userModel);
}

class UserLoggedOutState extends UserState {}

class UserErrorState extends UserState {
  final String message;

  UserErrorState(this.message);
}
