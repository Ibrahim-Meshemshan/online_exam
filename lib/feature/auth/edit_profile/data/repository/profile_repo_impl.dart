import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/edit_profile/data/data_source/contract/remote_data_source_contract.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/entity/change_password_entity.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/entity/profile_entity.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/repository/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  RemoteDataSourceContract remoteDataSourceContract;
  ProfileRepoImpl({required this.remoteDataSourceContract});
  @override
  Future<Either<Failures, ProfileEntity>> profile() {
    return remoteDataSourceContract.getProfile();
  }

  @override
  Future<Either<Failures, ProfileEntity>> editProfile(String lastName) {
    return remoteDataSourceContract.editProfile(lastName);
  }

  @override
  Future<Either<Failures, ChangePasswordEntity>> changePassword(String oldPassword, newPassword, confirmPassword) {
    return remoteDataSourceContract.changePassword(oldPassword, newPassword, confirmPassword);
  }

}