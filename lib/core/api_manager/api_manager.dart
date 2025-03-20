import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/app/explore/data/models/all_exam_dto.dart';
import 'package:online_exam/feature/app/explore/data/models/exam_question_model.dart';


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
  //TODO:======================Function IS Connected =======
  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }
  //TODO:======================Login method=================
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
  //TODO:======================Register method=================
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
  //TODO:======================Get Profile method=================
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
  //TODO:======================Edit Profile method=================
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
  //TODO:======================Change Password method=================
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
  //TODO:======================Get ALL Exam method=================
  Future<Either<Failures, AllExamDto>> getAllExam() async {
    {
      final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        try {
          final response = await dio.get(
            Constant.baseUrlExam + Constant.getAllExamEndpoint,
            options: Options(
              headers: {
                "token": Constant.token,
              },
            ),
          );
          print("Response Data: ${response.data}");

          var profileResponse = AllExamDto.fromJson(response.data);

          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return Right(profileResponse);
          } else {
            return Left(ServerError(errorMessage: profileResponse.message));
          }
        } on DioException catch (e) {
          print('DioException: ${e.response?.statusCode}, ${e.response?.data}');
          final errorMessage = e.response?.data?["message"].toString() ??
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
  //TODO:======================Get All Question method=================
  Future<Either<Failures, List<ExamQuestionModel>>> getAllQuestions() async {
    if (!await _isConnected()) {
      return Left(NetworkError(errorMessage: 'Please check internet connection'));
    }

    try {
      final response = await dio.get(
        "${Constant.baseUrlExam}${Constant.questionsEndpoint}",
        options: Options(
          headers: {
            "token": Constant.token,
          },
        ),
      );

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data is Map<String, dynamic>) {
          // استخراج البيانات من المفتاح الصحيح
          final Map<String, dynamic> jsonData = response.data;
          final List<dynamic> data = jsonData["questions"]; // استخدم المفتاح الصحيح هنا

          final questions = data.map((q) => ExamQuestionModel.fromJson(q)).toList();
          return Right(questions);
        } else if (response.data is List) {
          // في حالة كانت البيانات بالفعل قائمة
          final List<dynamic> data = response.data;
          final questions = data.map((q) => ExamQuestionModel.fromJson(q)).toList();
          return Right(questions);
        } else {
          return Left(ServerError(errorMessage: 'Unexpected response format'));
        }
      } else {
        return Left(ServerError(errorMessage: 'Unexpected error occurred'));
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data?["message"] ?? e.message ?? "An unexpected error occurred";
      return Left(ServerError(errorMessage: errorMessage));
    }
  }


}