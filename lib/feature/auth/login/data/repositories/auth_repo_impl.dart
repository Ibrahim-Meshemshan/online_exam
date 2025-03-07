import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/utils/failures.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/contract/remote_data_source_contract.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  RemoteDataSourceContract remoteDataSourceContract;
  AuthRepoImpl({required this.remoteDataSourceContract});
  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) {
    return remoteDataSourceContract.login(email, password);
  }

 
}
