import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';

import '../entity/profile_entity.dart';
import '../repository/profile_repo.dart';


@injectable
class GetProfileUseCase {
  ProfileRepo profileRepo;

  GetProfileUseCase({required this.profileRepo});

  Future<Either<Failures, ProfileEntity>> call() {
    return profileRepo.profile();
  }
}
