import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/theme_manager.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_text_form_field.dart';

import '../../../../../core/di/di.dart';
import '../cubit/profile_view_model_cubit.dart';
import 'change_password.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = 'edit_profile';

  EditProfileScreen({super.key});

  final viewModel = getIt.get<ProfileViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
            bloc: viewModel..getProfileCubit(),
            builder: (context, state) {
              if (state is ProfileViewModelLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileViewModelError) {
                return Center(
                  child: Text(
                      'Something went wrong: ${state.failures.runtimeType}'),
                );
              } else if (state is ProfileViewModelSuccess) {
                return Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/images/Photo.png'),
                      ),
                      CustomTextFormField(
                        labelText: 'User name',
                        hintText: viewModel.profile?.username ?? '',
                        keyboardType: TextInputType.name,
                        controller: viewModel.userNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'enter valid user name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          viewModel.isButtonEnabled.value = true;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              labelText: 'First name',
                              hintText: viewModel.profile?.firstName ?? '',
                              keyboardType: TextInputType.name,
                              controller: viewModel.firstNameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'enter valid first name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                viewModel.isButtonEnabled.value = true;
                              },
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: CustomTextFormField(
                              labelText: 'Last name',
                              hintText: viewModel.profile?.lastName ?? '',
                              keyboardType: TextInputType.name,
                              controller: viewModel.lastNameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'enter valid last name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                viewModel.isButtonEnabled.value = true;
                              },
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      CustomTextFormField(
                        labelText: 'Email',
                        hintText: viewModel.profile?.email ?? '',
                        keyboardType: TextInputType.name,
                        controller: viewModel.emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'enter valid email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          viewModel.isButtonEnabled.value = true;
                        },
                      ),
                      CustomTextFormField(
                        labelText: 'Password',
                        hintText: '********',
                        suffix: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Change',
                            style:
                                Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: ThemeManager.buttonColor,
                                    ),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        controller: viewModel.passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'enter valid password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          viewModel.isButtonEnabled.value = true;
                        },
                      ),
                      CustomTextFormField(
                        labelText: 'Phone number',
                        hintText: viewModel.profile?.phone ?? '',
                        keyboardType: TextInputType.name,
                        controller: viewModel.phoneController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty || value.length < 11) {
                            return 'enter valid egypt phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          viewModel.isButtonEnabled.value = true;
                        },
                      ),
                      50.verticalSpace,
                      ValueListenableBuilder<bool>(
                        valueListenable: viewModel.isButtonEnabled,
                        builder: (context, isEnabled, child) {
                          return Row(
                            children: [
                              CustomButton(
                                onPressed: isEnabled
                                    ? () {
                                        print("Updating profile...");
                                        viewModel.isButtonEnabled.value =
                                            false;
                                      }
                                    : () {},
                                text: 'Update',
                                backgroundColor: isEnabled ? ThemeManager.buttonColor : Colors.grey,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              return Container(width: 25, height: 25, color: Colors.red);
            },
          ),
        ),
      ),
    );
  }
}
