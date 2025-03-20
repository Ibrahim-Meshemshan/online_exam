import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/confirmation/email_verification/data/data_sources/remote_email_verify_data_source_contract.dart';

import '../../../../../../core/api_manager/api_manager.dart';

@Singleton(as: RemoteVerifyDatasourceContract)
class RemoteVerifyDatasourceImpl implements RemoteVerifyDatasourceContract {
  ApiManager apiManager;
  RemoteVerifyDatasourceImpl(this.apiManager);

  @override
  Future<Either<Failures, void>> verifyCode(String code) async {
    final response = await apiManager.verifyCode(code);

    if (response.statusCode == 200) {
      return Right(response); // Return success
    }
    return  Left(Failures(errorMessage: 'Failed to resend code'));
  }
}