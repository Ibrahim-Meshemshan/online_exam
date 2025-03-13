import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/dialog.dart';
import '../../../../../core/utils/sharedpreferences.dart';
import '../../../../../core/utils/theme_manager.dart';
import '../../../../app/presentation/pages/home_screen.dart';
import '../../../confirmation/presentation/pages/forget_password_screen.dart';
import '../../../register/presentation/pages/register_screen.dart';
import '../cubit/login_view_model_cubit.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthViewModelCubit>(),
      child: Builder(
        builder: (context) {
          final viewModel = context.read<AuthViewModelCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text('Login')),
            body: BlocListener<AuthViewModelCubit, AuthViewModelState>(
              listener: (context, state) {
                if (state.loginState == Status.loading) {
                  DialogUtils.showLoading(context, 'Loading ...');
                } else {
                  DialogUtils.hideLoading(context);

                  if (state.loginState == Status.error) {
                    DialogUtils.showMessage(
                        context, state.errorMessage ?? 'Login failed');
                  } else if (state.loginState == Status.success) {
                    Shared.saveData(
                        key: 'Token', value: state.loginResponseEntity?.token);

                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        readOnly: false,
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        keyboardType: TextInputType.emailAddress,
                        isObscure: false,
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
                      15.verticalSpace,
                      CustomTextFormField(
                        readOnly: false,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: viewModel.isObscurePassword,
                        controller: viewModel.passwordController,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              viewModel.isObscurePassword =
                                  !viewModel.isObscurePassword;
                            });
                          },
                          icon: Icon(
                            viewModel.isObscurePassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'enter valid password';
                          }
                          return null;
                        },
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Checkbox(
                            value: viewModel.rememberMe,
                            onChanged: (value) {
                              Shared.saveData(
                                  key: 'Token',
                                  value: context
                                      .read<AuthViewModelCubit>()
                                      .state
                                      .loginResponseEntity
                                      ?.token);
                              viewModel.rememberMe = value!;
                              setState(() {});
                            },
                          ),
                          const Text('Remember me'),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreen.routeName);
                            },
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.5,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      50.verticalSpace,
                      Row(
                        children: [
                          CustomButton(
                              onPressed: () {
                                if (viewModel.formKey.currentState!
                                    .validate()) {
                                  viewModel.login(
                                    viewModel.emailController.text,
                                    viewModel.passwordController.text,
                                  );
                                }
                              },
                              text: 'Login'),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterScreen.routeName);
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: ThemeManager.buttonColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
