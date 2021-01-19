import 'dart:convert';

import 'package:dio/dio.dart';

const baseUrl = "https://www.meidanbarapp.ir/api/v1/";
//const baseUrl = "http://195.114.8.204:8083/api/v1/";

class NetWorkApi {
  static BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 20000,
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "application/json",
    },);

  Dio dio = Dio(options);

  static final NetWorkApi _singleton = new NetWorkApi._internal();

  factory NetWorkApi() {
    return _singleton;
  }

  NetWorkApi._internal();

  Future<dynamic> getConnectionInfo() async {
    var _response = await dio.post("getConnectionInfo");
    print("afra1------> $_response");
    return jsonDecode("$_response");
  }


}