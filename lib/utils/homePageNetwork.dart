// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'baseUrls.dart';
// import 'dioNetwork.dart';




// class homePage_network{

//   static Future<dynamic>? getCategories() async {
//     Category? category;

//     try {
//       Response userData =
//           await DioClient().dio.get(BaseUrl.base_url! + api_urls.get_ca,
             
//               options: Options(
//                 headers: {"Content-Type": "application/json"},
//               ));
//       print('User Info: ${userData.data}');
//       user = User.fromJson(userData.data);
//       return user;
//     } on DioException catch (e) {
//       // The request was made and the server responded with a status code
//       // that falls out of the range of 2xx and is also not 304.
//       if (e.response != null) {
//         return ApiError(message: e.response!.statusMessage);
//         // print('Dio error!');
//         // print('STATUS: ${e.response?.statusCode}');
//         // print('DATA: ${e.response?.data}');
//         // print('HEADERS: ${e.response?.headers}');
//       } else {
//         return ApiError(message: e.error!.toString());
//         // // Error due to setting up or sending the request
//         // print('Error sending request!');
//         // print(e.message);
//       }
//     }
//   }







// }