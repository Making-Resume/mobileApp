import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:resumemaker/utils/baseUrls.dart';
import 'package:resumemaker/utils/dioNetwork.dart';

import 'ApiError.dart';

class User {
  int? code;
  String? message;
  var data;
  String? errors;
  String? action;

  User({
    this.errors,
    this.code,
    this.message,
    this.data,
    this.action,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      message: json['message'],
      code: json['code'],
      data: json['data'] != null ? json['data']['email'] : '',
      errors: json['errors'],
      action: json['action'],
    );
  }
}

class UserAuthenticationRepository {
  Future<dynamic>? Register({required String email}) async {
    User? user;
    var formData = jsonEncode({
      'email': email,
    });
    try {
      Response userData =
          await DioClient().dio.post(BaseUrl.base_url! + '/api/User/register',
              data: formData,
              options: Options(
                headers: {"Content-Type": "application/json"},
              ));
      print('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
      return user;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return ApiError(message: e.response!.statusMessage);
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        return ApiError(message: e.error!.toString());
        // // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);
      }
    }
  }

  Future<dynamic>? Login(
      {required String email, required String password}) async {
    final formData = FormData.fromMap({'email': email, 'password': password});
    User? user;
    try {
      Response userData = await DioClient()
          .dio
          .get(BaseUrl.base_url! + '/users', data: formData);
      print('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
      return user;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return ApiError(message: e.response!.statusMessage);
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        return ApiError(message: e.error!.toString());
        // // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);
      }
    }
  }

  Future<dynamic>? mainRegistration(
      {required String name,
      required String family,
      required String password}) async {
    User? user;
    var formData = jsonEncode({
      'Email': 'ayobkafrashian@gmail.com',
      'FirstName': name,
      'LastName': family,
      'Password': password,
    });
    try {
      Response userData = await DioClient()
          .dio
          .post(BaseUrl.base_url! + '/api/user/getInformation',
              data: formData,
              options: Options(
                headers: {"Content-Type": "application/json"},
              ));
      print('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
      return user;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return ApiError(message: e.response!.statusMessage);
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        return ApiError(message: e.error!.toString());
        // // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);
      }
    }
  }
}
