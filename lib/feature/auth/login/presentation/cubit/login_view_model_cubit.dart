import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/login_response_entity.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_view_model_state.dart';

@injectable
class AuthViewModelCubit extends Cubit<AuthViewModelState> {
  AuthViewModelCubit({required this.loginUseCase}) : super(const AuthViewModelState());
  LoginUseCase loginUseCase;
  bool isObscurePassword = true;
  bool rememberMe = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController =
      TextEditingController(text: 'ali@elevate.com');

  //asda
  TextEditingController passwordController =
      TextEditingController(text: 'Elevate@123');

  bool checkValidEmail(String? email) {
    if (email == null) return false;
    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  void login(String email, String password) async {
    emit(state.copyWith(loginState: Status.loading));

    var either =
        await loginUseCase.call(emailController.text, passwordController.text);

    either.fold(
      (left) => emit(state.copyWith(
          loginState: Status.error, errorMessage: left.errorMessage)),
      (response) => emit(state.copyWith(
          loginResponseEntity: response, loginState: Status.success)),
    );
  }
}
