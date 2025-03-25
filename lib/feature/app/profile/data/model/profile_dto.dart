
import '../../domain/entity/profile_entity.dart';

class ProfileDto extends ProfileEntity {
  ProfileDto({
    super.message,
    super.user,
  });

  ProfileDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
  }
}

class UserDto extends UserEntityProfile {
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
}
