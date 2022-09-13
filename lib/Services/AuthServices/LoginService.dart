import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Models/LoginModel/LoginRequestModel.dart';
import '../../Models/LoginModel/LoginResponseModel.dart';
import '../../Providers/AuthProvider/AuthProvider.dart';
import '../../Util/keys_constants.dart';
import '../API/api.dart';
import '../API/api_response.dart';
import '../API/app_exceptions.dart';
import '../SharedPreferenceService/SharedPreferencesService.dart';

class LoginSerice {
  Future<ApiResponse<LoginResponseModel>> loginUser(String email, String password, BuildContext context) async {
    try {
      Provider.of<AuthProvider>(context, listen: false).setLoading = true;
      LoginRequestModel _request = LoginRequestModel(email: email, password: password);
      var response = await Api.postRequestData("login", FormData.fromMap(_request.toJson()));
      LoginResponseModel responseModel = LoginResponseModel.fromJson(response);
      if (responseModel.status!) {
        await SharedPreferencesService.setString(KeysConstants.userId, responseModel.data!.id!);
      }
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
