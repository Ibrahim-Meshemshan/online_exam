import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/entity/profile_entity.dart';


abstract class RemoteDataSourceContract {
  Future<Either<Failures,ProfileEntity>> getProfile();
}