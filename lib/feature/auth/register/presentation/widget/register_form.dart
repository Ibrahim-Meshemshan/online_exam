
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/login/presentation/pages/login_screen.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_text_form_field.dart';
import 'package:online_exam/feature/auth/register/presentation/cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: context.read<RegisterCubit>().formKey,
            child: Column(
              spacing: 25.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: context.read<RegisterCubit>().userNameController,
                  labelText: "Username",
                  hintText: "Enter your username",
                  isObscure: false,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This user name is not valid';
                    }
                    return null;
                  },
                ),
                Row(
                  spacing: 20.w,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller:
                            context.read<RegisterCubit>().firstNameController,
                        labelText: "First Name",
                        hintText: "Enter first name",
                        isObscure: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller:
                            context.read<RegisterCubit>().lastNameController,
                        labelText: "Last Name",
                        hintText: "Enter last name",
                        isObscure: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  controller: context.read<RegisterCubit>().emailController,
                  labelText: "Email",
                  hintText: "Enter your Email",
                  isObscure: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Email is not valid';
                    }
                    return null;
                  },
                ),
                Row(
                  spacing: 20.w,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller:
                            context.read<RegisterCubit>().passwordController,
                        labelText: "Password",
                        hintText: "Enter Password",
                        isObscure: true,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller:
                            context.read<RegisterCubit>().repasswordController,
                        labelText: "Confirm password",
                        hintText: "Confirm password",
                        isObscure: true,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value !=
                              context
                                  .read<RegisterCubit>()
                                  .passwordController
                                  .text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  controller: context.read<RegisterCubit>().phoneController,
                  labelText: "Phone number",
                  hintText: "Enter your Phone number",
                  isObscure: false,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Phone number';
                    }
                    return null;
                  },
                ),
                 SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff02369C),
                    ),
                    onPressed: state is RegisterLoading
                        ? null
                        : () async {
                            if (context
                                .read<RegisterCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              context.read<RegisterCubit>().register();
                            }
                          },
                    child: state is RegisterLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "SignUp",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("Already have an account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,  LoginScreen.routeName);
                      },
                      child:  Text(
                        "Login",
                        style: TextStyle(
                            color: const Color(0xff02369C),
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xff02369C),
                            decorationThickness: 2,
                            height: 1.5.h,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
