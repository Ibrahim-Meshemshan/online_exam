
import 'package:online_exam/feature/auth/register/domain/entities/register_response_entity.dart';

class RegisterResponseModel extends RegisterResponseEntity {
  final String? message;
  final bool? success;
  final String token; // Change this line

  RegisterResponseModel({
    this.message,
    this.success,
    required this.token, // Add the required keyword
  }) : super(
          id: '',
          username: '',
          email: '',
          phone: '',
          token: token, // You can remove the null check here
        );
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      success: json['success'],
      token: json['token'],
    );
  }
}
