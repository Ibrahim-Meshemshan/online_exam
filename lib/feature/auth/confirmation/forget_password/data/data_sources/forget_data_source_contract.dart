import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../../domain/entities/forget_password_entity.dart';

abstract class RemoteForgetDatasourceContract {
  Future<Either<Failures, ForgetPasswordEntity>> forgetPassword(String email);
}