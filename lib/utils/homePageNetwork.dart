import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/ApiError.dart';
import '../models/categoryModel.dart';
import 'NetworkUrls.dart';
import 'baseUrls.dart';
import 'dioNetwork.dart';

class HomePage_Network {
  static Future<dynamic>? getCategories() async {
    Category_Model? category;
    List<Category_Model> categoryModels = [];

    try {
      Response category_data = await DioClient()
          .dio
          .get(BaseUrl.base_url! + Network_urls.get_Category,
              options: Options(
                headers: {"Content-Type": "application/json"},
              ));
      print('category Info: ${category_data}');
      // Map<String, dynamic> jsonData = jsonDecode(category_data.data);
       Category_Item category_item = Category_Item.fromJson(category_data.data);
       
      print("Code: ${category_item.code}");
      print("Message: ${category_item.message}");
      print("Items:");
      for (var item in category_item.items) {
         categoryModels.add(item);
         print("ID: ${item.id}, Title: ${item.title}, Image: ${item.image}");
      }

     
      return categoryModels;
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
