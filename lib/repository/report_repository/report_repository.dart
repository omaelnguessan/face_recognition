import 'dart:async';
import 'dart:io';

import 'package:face_recognition/data/network/network_api_services.dart';
import 'package:face_recognition/res/app_url/app_url.dart';

class ReportRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> report(var data, File image) async {
    dynamic response = await _apiService.postFileAndDataApi(image, data, AppUrl.reportUserInfoApi);
    return response;
  }

}