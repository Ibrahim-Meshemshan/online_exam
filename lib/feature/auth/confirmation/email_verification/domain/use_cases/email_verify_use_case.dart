import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../repositories/email_verify_repo_contract.dart';

@injectable
class VerifyEmailUseCase {
  VerifyEmailRepoContract verifyEmailRepoContract;
  VerifyEmailUseCase({required this.verifyEmailRepoContract});

  Future<Either<Failures, void>> call(String resetCode) {
    return verifyEmailRepoContract.verifyCode(resetCode);
  }
}