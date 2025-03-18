// @Singleton(as: RemoteVerifyDatasourceContract)
// class RemoteVerifyDatasourceImpl implements RemoteVerifyDatasourceContract {
//   ApiManager apiManager;
//   RemoteVerifyDatasourceImpl(this.apiManager);
//
//   @override
//   Future<Either<RemoteFailures, void>> verifyCode(String code) async {
//     final response = await apiManager.verifyCode(code);
//
//     if (response.statusCode == 200) {
//       return Right(response); // Return success
//     } else {
//       return Left(RemoteFailures('Failed to verify code'));
//     }
//   }
// }