

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/entity/profile_entity.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/repository/profile_repo.dart';

import '../../../../../core/utils/failures.dart';

@injectable
 class EditProfileUseCase {
  ProfileRepo profileRepo;
  EditProfileUseCase({required this.profileRepo});
  Future<Either<Failures,ProfileEntity>> call(String lastName){
    return profileRepo.editProfile(lastName);
  }
}