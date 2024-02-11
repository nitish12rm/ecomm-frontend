//toh repository ka kam kya hota h
//basically ye api see data leke model me dal deta h
//toh repository me api--> data--> model --> to be used in the application
 import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecomm/core/api.dart';
import 'package:ecomm/data/models/user/user_model.dart';
class UserRepository
{

final Api _api = Api();

Future<UserModel> createAccount({
  required String email,
  required String password,
}) async {
  try {
    //hm krenge yaha api pe post hamara email and password
    //toh jab hm email aur password ko api pe bhjenge
    //toh uspe ek reponse wa[is ayega jaise postman me aata h
    //eg: success:true, data:[] like this
    //aur jo ye request h ispe response ya toh error ayega ya fir user ka model
    //ayega
    Response response = await _api.sendRequest.post(
        '/user/createAccount',
        data: jsonEncode(
            {
              "email": email,
              "password": password
            }
        )
    );
    ApiResponse apiResponse = ApiResponse.fromResponse(response);
    //agar manlo response galat aata h then we canm throw error
    if (!apiResponse.success) {
      throw apiResponse.message.toString();
    }
    //convert this raw response data into user model
    return UserModel.fromJson(apiResponse.data);
  } catch (error) {
    rethrow;
  }
}

Future<UserModel> signIn({
  required String email,
  required String password,
}) async {
  try {
    //hm krenge yaha api pe post hamara email and password
    //toh jab hm email aur password ko api pe bhjenge
    //toh uspe ek reponse wa[is ayega jaise postman me aata h
    //eg: success:true, data:[] like this
    //aur jo ye request h ispe response ya toh error ayega ya fir user ka model
    //ayega
    Response response = await _api.sendRequest.post(
        '/user/signIn',
        data: jsonEncode(
            {
              "email": email,
              "password": password
            }
        )
    );
    ApiResponse apiResponse = ApiResponse.fromResponse(response);
    //agar manlo response galat aata h then we canm throw error
    if (!apiResponse.success) {
      throw apiResponse.message.toString();
    }
    //convert this raw response data into user model
    return UserModel.fromJson(apiResponse.data);
  } catch (error) {
    rethrow;
  }
}

}
