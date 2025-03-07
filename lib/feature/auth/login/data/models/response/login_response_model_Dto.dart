
import '../../../domain/entities/login_response_entity.dart';

class LoginResponseModelDto extends LoginResponseEntity {
  LoginResponseModelDto({
    super.message,
    super.token,
    super.user,
  });

  LoginResponseModelDto.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (user is UserDto) {
      map['user'] = (user as UserDto).toJson();
    }
    return map;
  }
}

class UserDto extends UserEntity {
  UserDto({
    super.id,
    super.username,
    super.firstName,
    super.lastName,
    super.email,
    super.phone,
    super.role,
    super.isVerified,
    super.createdAt,
  });

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    return map;
  }
}
