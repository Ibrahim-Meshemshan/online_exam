import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../../domain/entities/forget_password_entity.dart';
import '../../domain/repositories/forget_password_repo_contract.dart';
import '../data_sources/forget_data_source_contract.dart';

@Singleton(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract {
  RemoteForgetDatasourceContract remoteForgetDatasourceContract;
  ForgetPasswordRepoImpl(this.remoteForgetDatasourceContract);

  @override
  Future<Either<Failures, ForgetPasswordEntity>> forgetPassword(String email) async {
    return await remoteForgetDatasourceContract.forgetPassword(email);
  }
}