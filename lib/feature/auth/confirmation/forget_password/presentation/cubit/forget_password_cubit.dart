import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/forget_password_use_case.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordCubit(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  bool checkValidEmail(String? email) {
    if (email == null) return false;
    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  void sendResetEmail(String email) async {
    emit(ForgetPasswordLoading());
    final either = await forgetPasswordUseCase.call(email);
    either.fold(
      (l) {
        emit(ForgetPasswordFailure(message: l));
      },
      (r) {
        emit(ForgetPasswordSuccess(forgetPasswordEntity: r));
      },
    );
  }
}
