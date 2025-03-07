import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/utils/failures.dart';
import '../../domain/entities/register_request_entity.dart';
import '../../domain/entities/register_response_entity.dart';
import '../../domain/repositories/register_repo.dart';
import '../datasources/contract/contract_data_sourc.dart';
import '../models/register_requst_model.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  ContractDataSource remoteRegisterDataSource;
  RegisterRepoImpl(this.remoteRegisterDataSource);

  @override
  Future<Either<Failures, RegisterResponseEntity>> registerUser(
      RegisterRequestEntity registerRequest) async {
    final result = await remoteRegisterDataSource
        .registerUser(registerRequest as RegisterRequestModel);
    return result.map((response) => response as RegisterResponseEntity);
  }
}
