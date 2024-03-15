import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:resumemaker/utils/baseUrls.dart';
import 'package:resumemaker/utils/dioNetwork.dart';

import 'ApiError.dart';

class verification {
  int? code;
  String? message;
  var data;
  String? errors;
  String? action;

  verification({
    this.errors,
    this.code,
    this.message,
    this.data,
    this.action,
  });

  factory verification.fromJson(Map<String, dynamic> json) {
    return verification(
      message: json['message'],
      code: json['code'],
      data: json['data'] != null ? json['data']['email'] : '',
      errors: json['errors'],
      action: json['action'],
    );
  }
}

class verificatioRepository {
  Future<dynamic>? sendCode(
      {required String email, required int verification_code}) async {
    verification? user;
    var formData = jsonEncode({'email': email, 'code': verification_code});
    try {
      Response userData = await DioClient()
          .dio
          .post(BaseUrl.base_url! + '/api/User/checkCode',
              data: formData,
              options: Options(
                headers: {"Content-Type": "application/json"},
              ))
          .timeout(Duration(seconds: 6));
      print('User Info: ${userData.data}');
      user = verification.fromJson(userData.data);
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
