import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../Util/globals.dart';
import 'app_exceptions.dart';

class Api {
  static Future<dynamic> getRequestData(String apiEndPoint) async {
    var dio = Dio();
    String apiAddress = API_URL + apiEndPoint;
    print("URL: " + apiAddress);
    var responseJson;
    try {
      // String token =
      //     await SharedPreferencesService().getString(KeysConstants.accessToken);
      // print(token);
      final response = await dio.get(
        apiAddress,
      );
      responseJson = _returnListResponse(response);
      if (kDebugMode) {
        print(responseJson);
      }
      return responseJson;
    } on SocketException {
      print('Socket Exception');
      throw FetchDataException("No Internet Available");
    }
  }

  static Future<dynamic> postRequestData(String apiEndPoint, dynamic data) async {
    var dio = Dio();
    String apiAddress = API_URL + apiEndPoint;
    print("URL: " + apiAddress);
    var responseJson;
    try {
      // String token =
      //     await SharedPreferencesService().getString(KeysConstants.accessToken);
      var response = await dio.post(apiAddress, data: data);
      responseJson = _returnListResponse(response);
      if (kDebugMode) {
        print(responseJson);
      }
      return responseJson;
    } on SocketException {
      throw FetchDataException("No Internet Available");
    }
  }
}

dynamic _returnListResponse(Response response) {
  print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.data.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
      throw UnauthorisedException(response.data.toString());
    case 404:
      throw RequestNotFoundException(response.data.toString());
    case 403:
      throw UnautorizationException(response.data.toString());
    case 500:
      throw InternalServerException(response.data.toString());
    case 503:
      throw ServerNotFoundException(response.data.toString());
    default:
      throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
