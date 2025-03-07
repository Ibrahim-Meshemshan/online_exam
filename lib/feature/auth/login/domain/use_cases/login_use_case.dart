import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/failures.dart';
import '../entities/login_response_entity.dart';
import '../repositories/auth_repo.dart';
@injectable
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase({required this.authRepo});

  Future<Either<Failures, LoginResponseEntity>> call(String email,String password){
    return authRepo.login(email, password);
  }
}