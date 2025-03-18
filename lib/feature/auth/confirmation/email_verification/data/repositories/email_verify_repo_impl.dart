// @Singleton(as: VerifyEmailRepoContract)
// class VerifyEmailRepoImpl implements VerifyEmailRepoContract {
//   RemoteVerifyDatasourceContract remoteVerifyDatasourceContract;
//   VerifyEmailRepoImpl(this.remoteVerifyDatasourceContract);
//
//   @override
//   Future<Either<RemoteFailures, void>> verifyCode(String resetCode) async {
//     return await remoteVerifyDatasourceContract.verifyCode(resetCode);
//   }
// }