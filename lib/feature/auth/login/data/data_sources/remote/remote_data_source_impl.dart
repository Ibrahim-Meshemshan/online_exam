import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../../core/api_manager/api_manager.dart';
import '../../../../../../core/utils/failures.dart';
import '../../../domain/entities/login_response_entity.dart';
import '../contract/remote_data_source_contract.dart';

@Singleton(as: RemoteDataSourceContract)
class RemoteDataSourceImpl implements RemoteDataSourceContract {
  ApiManager apiManager;

  RemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    
    return either.fold(
          (failure) => Left(failure),
          (response) => Right(response),
    );
  }
}
