import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../entity/change_password_entity.dart';
import '../repository/profile_repo.dart';


@injectable
class ChangePasswordUseCase {
  ProfileRepo profileRepo;

  ChangePasswordUseCase({required this.profileRepo});

  Future<Either<Failures, ChangePasswordEntity>> call(
      String oldPassword, newPassword, confirmPassword) {
    return profileRepo.changePassword(
        oldPassword, newPassword, confirmPassword);
  }
}
