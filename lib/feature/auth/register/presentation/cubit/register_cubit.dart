import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_request_entity.dart';
import 'package:online_exam/feature/auth/register/domain/entities/register_response_entity.dart';
import 'package:online_exam/feature/auth/register/domain/usecases/register_usecase.dart';
part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  final RegisterUsecase registerUsecase;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> register() async {
    if (!formKey.currentState!.validate()) return false;

    emit(RegisterLoading());

    final requestEntity = RegisterRequestEntity(
      username: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      rePassword: repasswordController.text,
      phone: phoneController.text,
    );

    final userData = await registerUsecase.call(requestEntity);

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
    repasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
