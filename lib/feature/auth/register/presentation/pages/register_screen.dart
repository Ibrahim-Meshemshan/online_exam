import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/utils/dialog.dart';
import 'package:online_exam/core/utils/theme_manager.dart';
import 'package:online_exam/feature/app/home_body.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_text_form_field.dart';
import 'package:online_exam/feature/auth/register/presentation/cubit/register_cubit.dart';

import '../../../../app/explore/presentation/pages/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Builder(
        builder: (context) {
          final viewModel = context.read<RegisterCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text("Register")),
            body: BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  DialogUtils.showLoading(context, 'Loading...');
                } else {
                  DialogUtils.hideLoading(context);
                  if (state is RegisterFailure) {
                    DialogUtils.showMessage(
                        context, state.errorMessage ?? 'Registration failed');
                  } else if (state is RegisterSuccess) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, HomeBody.routeName);
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Form(
                  key: viewModel.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.userNameController,
                          labelText: "Username",
                          hintText: "Enter your username",
                          keyboardType: TextInputType.text,
                          validator: (value) => value!.isEmpty
                              ? 'This user name is not valid'
                              : null,
                        ),
                        15.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                readOnly: false,
                                controller: viewModel.firstNameController,
                                labelText: "First Name",
                                hintText: "Enter first name",
                                keyboardType: TextInputType.text,
                                validator: (value) => value!.isEmpty
                                    ? 'Enter a first name'
                                    : null,
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: CustomTextFormField(
                                readOnly: false,
                                controller: viewModel.lastNameController,
                                labelText: "Last Name",
                                hintText: "Enter last name",
                                keyboardType: TextInputType.text,
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter a last name' : null,
                              ),
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.emailController,
                          labelText: "Email",
                          hintText: "Enter your Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              viewModel.checkValidEmail(value!)
                                  ? null
                                  : 'Invalid email',
                        ),
                        15.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                readOnly: false,
                                controller: viewModel.passwordController,
                                labelText: "Password",
                                hintText: "Enter Password",
                                isObscure: viewModel.isObscurePassword,
                                keyboardType: TextInputType.visiblePassword,
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
                                validator: (value) => value!.length < 6
                                    ? 'Password too short'
                                    : null,
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: CustomTextFormField(
                                readOnly: false,
                                controller: viewModel.repasswordController,
                                labelText: "Confirm password",
                                hintText: "Confirm password",
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) =>
                                    value != viewModel.passwordController.text
                                        ? 'Passwords do not match'
                                        : null,
                                isObscure: viewModel.isObscureConfirmPassword,
                                icon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      viewModel.isObscureConfirmPassword =
                                          !viewModel.isObscureConfirmPassword;
                                    });
                                  },
                                  icon: Icon(
                                    viewModel.isObscureConfirmPassword
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.phoneController,
                          labelText: "Phone number",
                          hintText: "Enter your Phone number",
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter a valid phone number';
                            } else if (value.length < 11) {
                              return 'enter Egypt phone number';
                            }
                            return null;
                          },
                        ),
                        30.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeManager.buttonColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.r)),
                                  padding: EdgeInsets.all(14.sp),
                                ),
                                onPressed: () {
                                  if (viewModel.formKey.currentState!
                                      .validate()) {
                                    viewModel.register();
                                    Navigator.pushReplacementNamed(
                                        context, HomeScreen.routeName);
                                  }
                                },
                                child: Text(
                                  "Sign Up",
                                  style: ThemeManager
                                      .appTheme.textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
