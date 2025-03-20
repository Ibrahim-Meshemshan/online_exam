import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/theme_manager.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_text_form_field.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/dialog.dart';
import '../cubit/profile_view_model_cubit.dart';

class ChangePassword extends StatefulWidget {
  static const String routeName = 'reset_password';

  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileViewModelCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: BlocListener<ProfileViewModelCubit, ProfileViewModelState>(
            listener: (context, state) {
              if (state is ChangePasswordViewModelLoading) {
                DialogUtils.showLoading(context, 'Loading ...');
              } else {
                DialogUtils.hideLoading(context);

                if (state is ChangePasswordViewModelError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('incorrect current password'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state is ChangePasswordViewModelSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password updated successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              }
            },
            child: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
              builder: (context, state) {
                final viewModel = context.read<ProfileViewModelCubit>();

                return Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        readOnly: false,
                        labelText: 'Current password',
                        hintText: 'Enter your current password',
                        keyboardType: TextInputType.text,
                        controller: viewModel.passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your current password';
                          }
                          return null;
                        },
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              viewModel.currentIsObscurePassword =
                              !viewModel.currentIsObscurePassword;
                            });
                          },
                          icon: Icon(
                            viewModel.currentIsObscurePassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                        isObscure: viewModel.currentIsObscurePassword,
                      ),
                      10.verticalSpace,
                      CustomTextFormField(
                        readOnly: false,
                        labelText: 'New password',
                        hintText: 'Enter a new password',
                        keyboardType: TextInputType.text,
                        controller: viewModel.newPasswordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a new password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              viewModel.newIsObscurePassword =
                              !viewModel.newIsObscurePassword;
                            });
                          },
                          icon: Icon(
                            viewModel.newIsObscurePassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                        isObscure: viewModel.newIsObscurePassword,
                      ),
                      10.verticalSpace,
                      CustomTextFormField(
                        readOnly: false,
                        labelText: 'Confirm password',
                        hintText: 'Re-enter your new password',
                        keyboardType: TextInputType.text,
                        controller: viewModel.rePasswordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please confirm your new password';
                          } else if (value !=
                              viewModel.newPasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              viewModel.confirmIsObscurePassword =
                              !viewModel.confirmIsObscurePassword;
                            });
                          },
                          icon: Icon(
                            viewModel.confirmIsObscurePassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                        isObscure: viewModel.confirmIsObscurePassword,
                      ),
                      50.verticalSpace,
                      Row(
                        children: [
                          CustomButton(
                            onPressed: () {
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.changePassword(
                                  viewModel.passwordController.text,
                                  viewModel.newPasswordController.text,
                                  viewModel.rePasswordController.text,
                                );
                              }
                            },
                            text: 'Update',
                            backgroundColor: ThemeManager.buttonColor,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
