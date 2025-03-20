import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/register/data/datasources/contract/contract_data_sourc.dart';
import 'package:online_exam/feature/auth/register/data/models/register_requst_model.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_request_entity.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_response_entity.dart';
import 'package:online_exam/feature/auth/register/domain/repositories/register_repo.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  final ContractDataSource remoteRegisterDataSource;

  RegisterRepoImpl(this.remoteRegisterDataSource);

  @override
  Future<Either<Failures, RegisterResponseEntity>> registerUser(
      RegisterRequestEntity registerRequest) async {
    try {
      final result = await remoteRegisterDataSource
          .registerUser(RegisterRequestModel.fromEntity(registerRequest));
      return result.map((response) => response as RegisterResponseEntity);
    } catch (e) {
      return Left((ServerError(errorMessage: e.toString())));
    }
  }
}
