import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../../../domain/entity/change_password_entity.dart';
import '../../../domain/entity/profile_entity.dart';

abstract class RemoteDataSourceContractProfile {
  Future<Either<Failures, ProfileEntity>> getProfile();

  Future<Either<Failures, ProfileEntity>> editProfile(String lastName);

  Future<Either<Failures, ChangePasswordEntity>> changePassword(
      String oldPassword, newPassword, confirmPassword);
}
