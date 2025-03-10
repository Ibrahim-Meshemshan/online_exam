import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_request_entity.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_response_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failures, RegisterResponseEntity>> registerUser(
      RegisterRequestEntity registerRequest);
}
