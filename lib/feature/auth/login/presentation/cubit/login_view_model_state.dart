part of 'login_view_model_cubit.dart';

enum Status { initial, loading, success, error }

class AuthViewModelState {
  final String? errorMessage;
  final Status loginState;
  final Status forgetPasswordState;
  final LoginResponseEntity? loginResponseEntity;

  const AuthViewModelState({
    this.loginState = Status.initial,
     this.errorMessage,
    this.forgetPasswordState = Status.initial,
    this.loginResponseEntity,
  });

  AuthViewModelState copyWith({
    String? errorMessage,
    Status? loginState,
    Status? forgetPasswordState,
    LoginResponseEntity? loginResponseEntity,
  }) {
    return AuthViewModelState(
      errorMessage: errorMessage ?? this.errorMessage,
      loginState: loginState ?? this.loginState,
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      loginResponseEntity: loginResponseEntity ?? this.loginResponseEntity,
    );
  }
}
