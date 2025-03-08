import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../config/constant.dart';
import '../../feature/auth/login/data/models/request/login_request.dart';
import '../../feature/auth/login/data/models/response/login_response_model_Dto.dart';
import '../../feature/auth/register/data/models/register_requst_model.dart';
import '../../feature/auth/register/data/models/register_response_model.dart';
import '../utils/failures.dart';

@singleton
class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrlAuth,
    ),
  );

  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }

  Future<Either<Failures, LoginResponseModelDto>> login(
      String email, String password) async {
    {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        try {
          var loginRequest = LoginRequest(email: email, password: password);

          final response = await dio.post(
            Constant.baseUrlAuth + Constant.login,
            data: loginRequest.toJson(),
          );

          var loginResponse = LoginResponseModelDto.fromJson(response.data);


          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return Right(loginResponse);
          } else {
            return Left(ServerError(errorMessage: loginResponse.message));
          }
        } on DioException catch (e) {
          final errorMessage = e.response?.data?["message"] ??
              e.message ??
              "An unexpected error occurred";
          return Left(NetworkError(errorMessage: errorMessage));
        } 
      } else {
        print('Connectivity Result: $connectivityResult');
        //no internet connection
        return Left(
            NetworkError(errorMessage: 'please check internet connection'));
      }
    }
  }

  Future<Either<Failures, RegisterResponseModel>> register(
      RegisterRequestModel registerRequest) async {
    if (!await _isConnected()) {
      return Left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }

    try {
      final response = await dio.post(
        "${Constant.baseUrlAuth}${Constant.signup}",
        data: registerRequest.toJson(),
      );

      return response.statusCode! >= 200 && response.statusCode! < 300
          ? Right(RegisterResponseModel.fromJson(response.data))
          : Left(ServerError(errorMessage: 'Unexpected error occurred'));
    } on DioException catch (e) {
      final errorMessage = e.response?.data?["message"] ??
          e.message ??
          "An unexpected error occurred";
      return Left(ServerError(errorMessage: errorMessage));
    }
  }
}
