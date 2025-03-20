import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';

abstract class VerifyEmailRepoContract {
  Future<Either<Failures, void>> verifyCode(String resetCode);
}