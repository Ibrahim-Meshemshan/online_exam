abstract class EmailVerificationState {}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationSuccess extends EmailVerificationState {}

class EmailVerificationFailure extends EmailVerificationState {
  final String error;

  EmailVerificationFailure(this.error);
}