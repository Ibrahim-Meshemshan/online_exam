import 'package:dartz/dartz.dart';
import 'package:exam_app/core/utils/failures.dart';

import '../entities/register_request_entity.dart';
import '../entities/register_response_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failures, RegisterResponseEntity>> registerUser(
      RegisterRequestEntity registerRequest);
}
