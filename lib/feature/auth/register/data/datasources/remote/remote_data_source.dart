import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api_manager/api_manager.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/register/data/datasources/contract/contract_data_sourc.dart';
import 'package:online_exam/feature/auth/register/data/models/register_requst_model.dart';
import 'package:online_exam/feature/auth/register/data/models/register_response_model.dart';

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
