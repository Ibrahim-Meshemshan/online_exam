import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../../../../../../core/api_manager/api_manager.dart';
import '../../domain/entities/forget_password_entity.dart';
import 'forget_data_source_contract.dart';

@Singleton(as: RemoteForgetDatasourceContract)
class RemoteForgetDatasourceImpl implements RemoteForgetDatasourceContract {
  ApiManager apiManager;

  RemoteForgetDatasourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ForgetPasswordEntity>> forgetPassword(String email) async {
    final either = await apiManager.forgetPassword(email);

    return either.fold(
          (l) => Left(l),
          (r) => Right(r),
    );
  }

}
