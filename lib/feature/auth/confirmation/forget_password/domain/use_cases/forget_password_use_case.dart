import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../entities/forget_password_entity.dart';
import '../repositories/forget_password_repo_contract.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepoContract forgetPasswordRepoContract;

  ForgetPasswordUseCase({required this.forgetPasswordRepoContract});

  Future<Either<Failures, ForgetPasswordEntity>> call(String email) async {
    return forgetPasswordRepoContract.forgetPassword(email);
  }
}