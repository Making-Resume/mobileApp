import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:resumemaker/utils/baseUrls.dart';
import 'package:resumemaker/utils/dioNetwork.dart';

class User {
   int? statusCode;
   String? message;



  User({
       this.statusCode,
       this.message,
  });

  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}







class UserAuthenticationRepository {
   
  

 Future<dynamic>? Register ({required String email}) async{
     User? user;
final formData = FormData.fromMap({
  'email': email,
});
  try {
    Response userData = await DioClient().dio.post( BaseUrl.base_url! + '/users' , data: formData);
    print('User Info: ${userData.data}');
    user = User.fromJson(userData.data);
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      print('Error sending request!');
      print(e.message);
    }
  }
  return user;

 }


Future<dynamic>? Login({required String email , required String password}) async{
  final formData = FormData.fromMap({
  'email': email,
  'password':password
});
  User? user;
  try {
    Response userData = await DioClient().dio.get( BaseUrl.base_url! + '/users' , data: formData);
    print('User Info: ${userData.data}');
    user = User.fromJson(userData.data);
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      print('Error sending request!');
      print(e.message);
    }
  }
  return user;

 }

 


}