//presentation layer aur data layer kko connect karta h ek logic component
//global state management ke liye hm cubit/bloc use karenge
// and page specific satte management ke liye provider ka use karemnge

//cubit/provider/bloc ye link hota h between DATA and PRESENTATION
//so data[repository] ke sare functions available karan padenge.. CUBIT me
//ki presentation bhi use kar sake
import 'package:ecomm/data/models/user/user_model.dart';
import 'package:ecomm/data/repository/user_repository.dart';
import 'package:ecomm/logic/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  //toh data layer ke sigina nd create account functions ko yaha pe available karana hoga
  final UserRepository _userRepository = UserRepository();

  void signIn({required email, required password}) async {
    try {
      UserModel userModel =
          await _userRepository.signIn(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (error) {
      emit(UserErrorState(error.toString()));
    }
  }

  void createAccount({required email, required password}) async {
    try {
      UserModel userModel =  await _userRepository.createAccount(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (error) {
      emit(UserErrorState(error.toString()));
    }
  }
}
//abb iss user cubit ko globally available karana hoga ki pure app ke screen ko pata ho ki user ka login status kya h