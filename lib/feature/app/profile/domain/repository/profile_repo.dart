import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../entity/change_password_entity.dart';
import '../entity/profile_entity.dart';


abstract class ProfileRepo {
  Future<Either<Failures, ProfileEntity>> profile();

  Future<Either<Failures, ProfileEntity>> editProfile(String lastName);

  Future<Either<Failures, ChangePasswordEntity>> changePassword(
      String oldPassword, newPassword, confirmPassword);
}
