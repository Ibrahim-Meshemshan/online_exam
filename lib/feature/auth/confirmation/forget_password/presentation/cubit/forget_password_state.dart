import 'package:online_exam/core/utils/failures.dart';

import '../../domain/entities/forget_password_entity.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  ForgetPasswordEntity forgetPasswordEntity;

  ForgetPasswordSuccess({required this.forgetPasswordEntity});
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final Failures message;

  ForgetPasswordFailure({required this.message});
}
