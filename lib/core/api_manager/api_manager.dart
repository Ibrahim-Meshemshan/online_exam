import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';


import '../../config/constant.dart';
import '../../feature/app/profile/data/model/change_password_dto.dart';
import '../../feature/app/profile/data/model/profile_dto.dart';
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
            Constant.baseUrlAuth + Constant.loginEndpoint,
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
        "${Constant.baseUrlAuth}${Constant.signupEndpoint}",
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

  Future<Either<Failures, ProfileDto>> getProfile() async {
    {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        try {
          final response = await dio.get(
            Constant.baseUrlAuth + Constant.profileEndpoint,
            options: Options(
              headers: {
                "token": Constant.token,
              },
            ),
          );

          var profileResponse = ProfileDto.fromJson(response.data);

          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return Right(profileResponse);
          } else {
            return Left(ServerError(errorMessage: profileResponse.message));
          }
        } on DioException catch (e) {
          print('DioException: ${e.response?.statusCode}, ${e.response?.data}');
          final errorMessage = e.response?.data?["message"] ??
              e.message ??
              "An unexpected error occurred";
          return Left(NetworkError(errorMessage: errorMessage));
        }
      } else {
        print('Connectivity Result: $connectivityResult');
        //no internet connection
        return Left(
          NetworkError(errorMessage: 'please check internet connection'),
        );
      }
    }
  }

  Future<Either<Failures, ProfileDto>> editProfile(String lastName) async {
    {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        try {
          final response = await dio.put(
            Constant.baseUrlAuth + Constant.editProfileEndpoint,
            data: {'lastName': lastName},
            options: Options(
              headers: {
                "token": Constant.token,
              },
            ),
          );

          var profileResponse = ProfileDto.fromJson(response.data);

          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return Right(profileResponse);
          } else {
            return Left(ServerError(errorMessage: profileResponse.message));
          }
        } on DioException catch (e) {
          print('DioException: ${e.response?.statusCode}, ${e.response?.data}');
          final errorMessage = e.response?.data?["message"] ??
              e.message ??
              "An unexpected error occurred";
          return Left(NetworkError(errorMessage: errorMessage));
        }
      } else {
        print('Connectivity Result: $connectivityResult');
        //no internet connection
        return Left(
          NetworkError(errorMessage: 'please check internet connection'),
        );
      }
    }
  }

  Future<Either<Failures, ChangePasswordDto>> changePassword(
      String oldPassword, newPassword, confirmPassword) async {
    {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        try {
          final response = await dio.patch(
            Constant.baseUrlAuth + Constant.changePasswordEndpoint,
            data: {
              "oldPassword": oldPassword,
              "password": newPassword,
              "rePassword": confirmPassword
            },
            options: Options(
              headers: {
                "token": Constant.token,
              },
            ),
          );

          var changePasswordResponse =
              ChangePasswordDto.fromJson(response.data);

          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return Right(changePasswordResponse);
          } else {
            return Left(
                ServerError(errorMessage: changePasswordResponse.message));
          }
        } on DioException catch (e) {
          print('DioException: ${e.response?.statusCode}, ${e.response?.data}');
          final errorMessage = e.response?.data?["message"] ??
              e.message ??
              "An unexpected error occurred";
          return Left(NetworkError(errorMessage: errorMessage));
        }
      } else {
        print('Connectivity Result: $connectivityResult');
        //no internet connection
        return Left(
          NetworkError(errorMessage: 'please check internet connection'),
        );
      }
    }
  }
}
