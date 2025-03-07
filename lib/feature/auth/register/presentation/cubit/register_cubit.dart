import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/register_request_entity.dart';
import '../../domain/entities/register_response_entity.dart';
import '../../domain/usecases/register_usecase.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  final RegisterUseCase registerUseCase;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> register() async {
    emit(RegisterLoading());

    final requestEntity = RegisterRequestEntity(
      username: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      rePassword: rePasswordController.text,
      phone: phoneController.text,
    );

    final userData = await registerUseCase.call(requestEntity);

    bool isSuccess = false;

    userData.fold(
      (left) {
        emit(RegisterFailure(left.errorMessage.toString()));
        isSuccess = false;
      },
      (response) {
        emit(RegisterSuccess(response));
        isSuccess = true;
      },
    );

    return isSuccess;
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
