part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponseEntity message;
  const RegisterSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterFailure extends RegisterState {
  final String errorMessage;
  const RegisterFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
