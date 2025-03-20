import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api_manager/api_manager.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/profile/data/data_source/contract/remote_data_source_contract.dart';

import '../../../domain/entity/change_password_entity.dart';
import '../../../domain/entity/profile_entity.dart';


@Singleton(as: RemoteDataSourceContractProfile)
class RemoteDataSourceProfileImpl implements RemoteDataSourceContractProfile {
  ApiManager apiManager;

  RemoteDataSourceProfileImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProfileEntity>> getProfile() async {
    var either = await apiManager.getProfile();
    return either.fold(
          (failure) => Left(failure),
          (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, ProfileEntity>> editProfile(String lastName) async {
    var either = await apiManager.editProfile(lastName);
    return either.fold(
          (l) => Left(l),
          (r) => Right(r),
    );
  }

  @override
  Future<Either<Failures, ChangePasswordEntity>> changePassword(
      String oldPassword, newPassword, confirmPassword) async {
    var either = await apiManager.changePassword(
        oldPassword, newPassword, confirmPassword);
    return either.fold(
          (l) => Left(l),
          (r) => Right(r),
    );
  }
}