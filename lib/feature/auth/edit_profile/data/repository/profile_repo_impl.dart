import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/edit_profile/data/data_source/contract/remote_data_source_contract.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/entity/profile_entity.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/repository/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  RemoteDataSourceContract remoteDataSourceContract;
  ProfileRepoImpl({required this.remoteDataSourceContract});
  @override
  Future<Either<Failures, ProfileEntity>> getProfile() {
    return remoteDataSourceContract.getProfile();
  }

}