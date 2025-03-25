import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../entities/forget_password_entity.dart';

abstract class ForgetPasswordRepoContract {
  Future<Either<Failures, ForgetPasswordEntity>> forgetPassword(String email);
}