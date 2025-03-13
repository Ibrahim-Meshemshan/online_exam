import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_request_entity.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_response_entity.dart';
import 'package:online_exam/feature/auth/register/domain/repositories/register_repo.dart';

@injectable
class RegisterUsecase {
  final RegisterRepo registerRepo;

  RegisterUsecase(this.registerRepo);

  Future<Either<Failures, RegisterResponseEntity>> call(
      RegisterRequestEntity request) async {
    return await registerRepo.registerUser(request);
  }
}
