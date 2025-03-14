import 'package:online_exam/feature/auth/edit_profile/domain/entity/change_password_entity.dart';

class ChangePasswordDto extends ChangePasswordEntity {
  ChangePasswordDto({
    super.message,
    super.token,
  });

  ChangePasswordDto.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
