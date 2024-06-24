import 'dart:async';

import 'package:face_recognition/data/network/network_api_services.dart';
import 'package:face_recognition/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> userCheck(var data) async {
    dynamic response = await _apiService.postFileApi(data, AppUrl.predictUserApi);
    return response;
  }

}