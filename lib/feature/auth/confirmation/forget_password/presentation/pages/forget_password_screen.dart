import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';

import '../../../../../../core/utils/dialog.dart';
import '../../../../../../core/utils/theme_manager.dart';

import '../../../../login/presentation/widgets/custom_button.dart';
import '../../../../login/presentation/widgets/custom_text_form_field.dart';

import '../../../email_verification/presentation/pages/email_verify_screen.dart';
import '../cubit/forget_password_cubit.dart';
import '../cubit/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = 'forget_password';

  const ForgetPasswordScreen({super.key});

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password',
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
        child: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: Builder(builder: (context) {
            final viewModel = context.read<ForgetPasswordCubit>();
            return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordLoading) {
                  DialogUtils.showLoading(context, 'Loading ...');
                } else {
                  DialogUtils.hideLoading(context);

                  if (state is ForgetPasswordFailure) {
                    DialogUtils.showMessage(context, state.message.toString());
                  } else if (state is ForgetPasswordSuccess) {}
                }
              },
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Forget Password',
                        style: ThemeManager.appTheme.textTheme.titleMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      20.verticalSpace,
                      Text(
                        'Please enter your email associated to your account',
                        style: ThemeManager.appTheme.textTheme.titleMedium
                            ?.copyWith(
                                color: Colors.black, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      CustomTextFormField(
                        readOnly: false,
                        labelText: 'email',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        controller: viewModel.emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'enter valid email address';
                          }
                          if (!viewModel.checkValidEmail(value)) {
                            return 'invalid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      70.verticalSpace,
                      Row(
                        children: [
                          CustomButton(
                              backgroundColor: ThemeManager.buttonColor,
                              onPressed: () {
                                if (viewModel.formKey.currentState!.validate()) {
                                  viewModel.sendResetEmail(
                                      viewModel.emailController.text);
                                  Navigator.pushNamed(context, EmailVerificationScreen.routeName);
                                }
                              },
                              text: 'Continue'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
