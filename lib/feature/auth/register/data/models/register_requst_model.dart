import 'package:online_exam/feature/auth/register/domain/entities/register_request_entity.dart';

class RegisterRequestModel extends RegisterRequestEntity {
  RegisterRequestModel({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) : super(
          username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
        );

  factory RegisterRequestModel.fromEntity(RegisterRequestEntity entity) {
    return RegisterRequestModel(
      username: entity.username ?? '',
      firstName: entity.firstName ?? '',
      lastName: entity.lastName ?? '',
      email: entity.email ?? '',
      password: entity.password ?? '',
      rePassword: entity.rePassword ?? '',
      phone: entity.phone ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone,
    };
  }
}
