import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../../domain/repositories/email_verify_repo_contract.dart';
import '../data_sources/remote_email_verify_data_source_contract.dart';

@Singleton(as: VerifyEmailRepoContract)
class VerifyEmailRepoImpl implements VerifyEmailRepoContract {
  RemoteVerifyDatasourceContract remoteVerifyDatasourceContract;
  VerifyEmailRepoImpl(this.remoteVerifyDatasourceContract);

  @override
  Future<Either<Failures, void>> verifyCode(String resetCode) async {
    return await remoteVerifyDatasourceContract.verifyCode(resetCode);
  }
}