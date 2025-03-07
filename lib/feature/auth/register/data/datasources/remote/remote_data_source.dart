import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import '../../../../../../core/api_manager/api_manager.dart';
import '../../../../../../core/utils/failures.dart';
import '../../models/register_requst_model.dart';
import '../../models/register_response_model.dart';
import '../contract/contract_data_sourc.dart';

@Injectable(as: ContractDataSource)
class RemoteRegisterDataSource implements ContractDataSource {
  final ApiManager apiManager;

  RemoteRegisterDataSource(this.apiManager);

  @override
  Future<Either<Failures, RegisterResponseModel>> registerUser(
      RegisterRequestModel registerRequest) async {
    return await apiManager.register(registerRequest);
  }
}
