import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/failures.dart';
import '../../../domain/entities/login_response_entity.dart';



abstract class RemoteDataSourceContract {
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);

  
}
