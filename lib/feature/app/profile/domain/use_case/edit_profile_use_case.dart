

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/utils/failures.dart';
import '../entity/profile_entity.dart';
import '../repository/profile_repo.dart';

@injectable
 class EditProfileUseCase {
  ProfileRepo profileRepo;
  EditProfileUseCase({required this.profileRepo});
  Future<Either<Failures,ProfileEntity>> call(String lastName){
    return profileRepo.editProfile(lastName);
  }
}