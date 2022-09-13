import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Models/SignupModel/SignupRequestModel.dart';
import '../../Models/SignupModel/SignupResponseModel.dart';
import '../../Providers/AuthProvider/AuthProvider.dart';
import '../API/api.dart';
import '../API/api_response.dart';
import '../API/app_exceptions.dart';

class SignupService {
  Future<ApiResponse<SignupResponseModel>> registerUser(String name, String email, String password, BuildContext context) async {
    try {
      Provider.of<AuthProvider>(context, listen: false).setLoading = true;
      SignupRequestModel _request = SignupRequestModel(name: name, email: email, password: password);
      var response = await Api.postRequestData("register", FormData.fromMap(_request.toJson()));
      SignupResponseModel responseModel = SignupResponseModel.fromJson(response);
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.completed(responseModel);
    } on BadRequestException {
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error('Bad Request Exception');
    } on UnauthorisedException {
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error('The User is Un-authorized');
    } on RequestNotFoundException {
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error('Request Not Found');
    } on UnautorizationException {
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error('The User is Un-authorized');
    } on InternalServerException {
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error('Internal Server Error');
    } on ServerNotFoundException {
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error('Server Not Available');
    } on FetchDataException {
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error('An Error occurred while Fetching the Data');
    } catch (e) {
      print(e.toString());
      Provider.of<AuthProvider>(context, listen: false).setLoading = false;
      return ApiResponse.error(e.toString());
    }
  }
}
