import 'package:dartz/dartz.dart';

import '../../../../../../core/utils/failures.dart';

abstract class RemoteVerifyDatasourceContract {
  Future<Either<Failures, void>> verifyCode(String resetCode);
}