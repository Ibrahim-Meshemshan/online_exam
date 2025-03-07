import 'package:dartz/dartz.dart';
import 'package:exam_app/core/utils/failures.dart';

import 'package:injectable/injectable.dart';

import '../entities/register_request_entity.dart';
import '../entities/register_response_entity.dart';
import '../repositories/register_repo.dart';

@injectable
class RegisterUseCase {
  final RegisterRepo registerRepo;

  RegisterUseCase(this.registerRepo);

  Future<Either<Failures, RegisterResponseEntity>> call(
      RegisterRequestEntity request) async {
    return await registerRepo.registerUser(request);
  }
}
