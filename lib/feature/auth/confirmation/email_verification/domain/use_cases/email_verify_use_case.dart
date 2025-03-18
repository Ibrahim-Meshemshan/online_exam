// @injectable
// class VerifyEmailUsecase {
//   VerifyEmailRepoContract verifyEmailRepoContract;
//   VerifyEmailUsecase({required this.verifyEmailRepoContract});
//
//   Future<Either<RemoteFailures, void>> call(String resetCode) {
//     return verifyEmailRepoContract.verifyCode(resetCode);
//   }
// }