import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/failures.dart';
import '../../models/register_requst_model.dart';
import '../../models/register_response_model.dart';

abstract class ContractDataSource {
  Future<Either<Failures, RegisterResponseModel>> registerUser(
      RegisterRequestModel registerRequest);
}
