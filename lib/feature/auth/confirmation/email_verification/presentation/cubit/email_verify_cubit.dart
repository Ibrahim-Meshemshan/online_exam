import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/auth/confirmation/email_verification/domain/use_cases/email_verify_use_case.dart';

import 'email_verify_state.dart';

@injectable
class EmailVerificationViewModel extends Cubit<EmailVerificationState> {
  final VerifyEmailUseCase verifyEmailUseCase;

  EmailVerificationViewModel(this.verifyEmailUseCase)
      : super(EmailVerificationInitial());

  Future<void> verifyEmail(String code) async {
    emit(EmailVerificationLoading());

    try {
      await verifyEmailUseCase.call(code);
      emit(EmailVerificationSuccess());
    } catch (e) {
      emit(EmailVerificationFailure(e.toString()));
    }
  }
}