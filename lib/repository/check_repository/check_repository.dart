import 'dart:async';

import 'package:face_recognition/data/network/network_api_services.dart';
import 'package:face_recognition/res/app_url/app_url.dart';

class CheckRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> saveUser(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.saveUserInfoApi);
    return response;
  }

}