import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/register/data/models/register_requst_model.dart';
import 'package:online_exam/feature/auth/register/data/models/register_response_model.dart';

abstract class ContractDataSource {
  Future<Either<Failures, RegisterResponseModel>> registerUser(
      RegisterRequestModel registerRequest);
}
