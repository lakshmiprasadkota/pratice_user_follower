import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pratice_user_followers/models/user_model.dart';
import 'package:pratice_user_followers/network/response.dart';

import 'base_network.dart';



class listItemsManager {
  factory listItemsManager() {
    return _singleton;
  }

  listItemsManager._internal();

  static final listItemsManager _singleton = listItemsManager._internal();

  Future<ResponseData> fetchNewsCategories() async {

    Response response;
    try {
      response = await dioClient.ref!
          .get<dynamic>("/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users");

      if(response.statusCode == 200) {
        final model = UserDetails.fromMap(response.data);
        return ResponseData("", ResponseStatus.SUCCESS, data: model);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( err.toString(), ResponseStatus.FAILED);
    }

  }


}

listItemsManager personalizationManager = listItemsManager();
