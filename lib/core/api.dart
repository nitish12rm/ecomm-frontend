import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "http://192.168.1.5:3000/api";
const Map<String,dynamic> DEFAULT_HEADERS = {
  'content-type':'application/json'
};
//two classes will be there to handle the api
//API to send the request
//ApiResponse to get the response

class Api{
// to send http requests: install DIO package
//initialise the the dio package
final Dio _dio = Dio();
//now initialising some field of dio os that it makes our life easy by not
//making us feed some redundant data like baseurl headers and all
//so using a constructor we will initialiase it
Api(){
  _dio.options.baseUrl = BASE_URL;
  _dio.options.headers = DEFAULT_HEADERS;
  //we will add a interceptor which will make our life easy by showing requests
  //and responses in the debug console.. so that we dont explicitly log or print em
  _dio.interceptors.add(PrettyDioLogger(
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true
  ));
}
  //to use the _dio instance we will create a getter
//type get getter_name => instance

  Dio get sendRequest => _dio;
}

class ApiResponse{
  //in our ecomm backend
  //the api is always returning the combination of these three
  // SUCCESS, DATA, MESSAGE
  // so we will be handling these reposnses

  bool success;
  dynamic data;
  String? message;

  ApiResponse({required this.success, this.data,this.message});
  //ab jo response ayega from dio request..
//usko hm iss ApiResponse model me dalenge
//uske liye ek named constructor banaynge

factory ApiResponse.fromResponse(Response res){
  final data = res.data;
  return ApiResponse(
      success: data["success"],
      data: data["data"],
      message: data["message"] ?? "unexpected error"
  );
}




}