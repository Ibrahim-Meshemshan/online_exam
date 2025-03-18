// @injectable
// class EmailVerificationViewModel extends Cubit<EmailVerificationState> {
//   final VerifyEmailUsecase verifyEmailUsecase;
//
//   EmailVerificationViewModel(this.verifyEmailUsecase)
//       : super(EmailVerificationInitial());
//
//   Future<void> verifyEmail(String code) async {
//     emit(EmailVerificationLoading());
//
//     try {
//       await verifyEmailUsecase.call(code);
//       emit(EmailVerificationSuccess());
//     } catch (e) {
//       emit(EmailVerificationFailure(e.toString()));
//     }
//   }
// }