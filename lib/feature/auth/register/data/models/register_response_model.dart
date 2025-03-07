class RegisterResponseModel {
  final String? message;
  final bool? success;
  final String? token;

  // Constructor
  RegisterResponseModel({
    this.message,
    this.success,
    this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      success: json['success'],
      token: json['token'],
    );
  }
}
