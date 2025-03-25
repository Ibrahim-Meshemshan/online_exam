import 'package:dartz/dartz.dart';

import '../../../../../core/utils/failures.dart';
import '../entities/login_response_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);

}
