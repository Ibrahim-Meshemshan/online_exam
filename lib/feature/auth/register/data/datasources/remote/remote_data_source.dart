import 'package:dartz/dartz.dart';
import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/core/utils/failures.dart';
import 'package:injectable/injectable.dart';
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
