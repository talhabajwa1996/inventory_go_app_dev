import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Providers/AuthProvider/AuthProvider.dart';
import '../../Util/keys_constants.dart';
import '../API/api_response.dart';
import '../API/app_exceptions.dart';
import '../SharedPreferenceService/SharedPreferencesService.dart';

// class UserProfileService {
//   Future<ApiResponse<GetUserProfileResponseModel>> getUserProfile(
//       BuildContext context) async {
//     try {
//       String? _userId =
//           await SharedPreferencesService.getString(KeysConstants.userId);
//       GetUserProfileRequestModel _request =
//           GetUserProfileRequestModel(userId: _userId!);
//       var response = await Api.postRequestData(
//           "get_user_profile", FormData.fromMap(_request.toJson()));
//       GetUserProfileResponseModel responseModel =
//           GetUserProfileResponseModel.fromJson(response);
//       Provider.of<AuthProvider>(context, listen: false).setUserProfileData =
//           responseModel;
//       return ApiResponse.completed(responseModel);
//     } on BadRequestException {
//       return ApiResponse.error('Bad Request Exception');
//     } on UnauthorisedException {
//       return ApiResponse.error('The User is Un-authorized');
//     } on RequestNotFoundException {
//       return ApiResponse.error('Request Not Found');
//     } on UnautorizationException {
//       return ApiResponse.error('The User is Un-authorized');
//     } on InternalServerException {
//       return ApiResponse.error('Internal Server Error');
//     } on ServerNotFoundException {
//       return ApiResponse.error('Server Not Available');
//     } on FetchDataException {
//       return ApiResponse.error('An Error occurred while Fetching the Data');
//     } catch (e) {
//       return ApiResponse.error(e.toString());
//     }
//   }
//
//   Future<ApiResponse<UpdateUserProfileResponseModel>> updateUserProfile(
//       String name,
//       String email,
//       String designation,
//       String company,
//       BuildContext context) async {
//     try {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = true;
//       String? _userId =
//           await SharedPreferencesService.getString(KeysConstants.userId);
//       UpdateUserProfileRequestModel _request = UpdateUserProfileRequestModel(
//           userId: _userId!,
//           name: name,
//           email: email,
//           company: company,
//           designation: designation);
//       var response = await Api.postRequestData(
//           "update_profile", FormData.fromMap(_request.toJson()));
//       UpdateUserProfileResponseModel responseModel =
//           UpdateUserProfileResponseModel.fromJson(response);
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.completed(responseModel);
//     } on BadRequestException {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error('Bad Request Exception');
//     } on UnauthorisedException {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error('The User is Un-authorized');
//     } on RequestNotFoundException {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error('Request Not Found');
//     } on UnautorizationException {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error('The User is Un-authorized');
//     } on InternalServerException {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error('Internal Server Error');
//     } on ServerNotFoundException {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error('Server Not Available');
//     } on FetchDataException {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error('An Error occurred while Fetching the Data');
//     } catch (e) {
//       Provider.of<AuthProvider>(context, listen: false).setLoading = false;
//       return ApiResponse.error(e.toString());
//     }
//   }
// }
