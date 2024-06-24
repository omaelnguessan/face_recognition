class AppUrl {

  static const String baseManagerApi = "http://172.20.200.139/api";

  static const String baseRecognitionApi = "http://172.20.200.139:7123";

  static const String predictUserApi = "$baseRecognitionApi/predict";

  static const String saveUserInfoApi = "$baseManagerApi/report";

  static const String reportUserInfoApi = "$baseManagerApi/request_image_change";

}