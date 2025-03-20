
import '../../domain/entities/forget_password_entity.dart';

class ForgetPasswordDto extends ForgetPasswordEntity {
  ForgetPasswordDto({
    super.message,
    super.info,
  });

  ForgetPasswordDto.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    return map;
  }
}
