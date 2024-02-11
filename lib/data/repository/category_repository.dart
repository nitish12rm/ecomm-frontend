//toh repository ka kam kya hota h
//basically ye api see data leke model me dal deta h
//toh repository me api--> data--> model --> to be used in the application
import 'dart:convert';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:ecomm/core/api.dart';
import 'package:ecomm/data/models/category/category_model.dart';
import 'package:ecomm/data/models/user/user_model.dart';
class UserRepository {

  final Api _api = Api();

  Future <List<CategoryModel>> FetchAllCategory() async {
    try {
      //hm krenge yaha api pe post hamara email and password
      //toh jab hm email aur password ko api pe bhjenge
      //toh uspe ek reponse wa[is ayega jaise postman me aata h
      //eg: success:true, data:[] like this
      //aur jo ye request h ispe response ya toh error ayega ya fir user ka model
      //ayega
      Response response = await _api.sendRequest.get(
        '/category',
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      //agar manlo response galat aata h then we canm throw error
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      //convert this raw response data into category model
      //yaha pe multiple obhjects ayengi so hm response ko list me parse karlenge and iss
      //method ka return type bhi List karna hoga
      //each category will be compiled into a list then we will map that list to the
      //categorymodel and then again convert it to a list
      return (apiResponse.data as List<dynamic>).map((json) =>
          CategoryModel.fromJson(json)).toList();
    } catch (error) {
      rethrow;
    }
  }

}