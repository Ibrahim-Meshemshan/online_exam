import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/presentation/widgets/custom_text_form_field.dart';
import '../cubit/register_cubit.dart';


class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            print("Current State: $state");

            if (state is RegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RegisterFailure) {
              return Center(
                  child: Text(state.errorMessage,
                      style: const TextStyle(color: Colors.red)));
            }

            return SingleChildScrollView(
              child: Form(
                key: context.read<RegisterCubit>().formKey,
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      controller:
                          context.read<RegisterCubit>().userNameController,
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
                      spacing: 5,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: context
                                .read<RegisterCubit>()
                                .firstNameController,
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
                            controller: context
                                .read<RegisterCubit>()
                                .lastNameController,
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
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This Email is not valid';
                        }
                        return null;
                      },
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: context
                                .read<RegisterCubit>()
                                .passwordController,
                            labelText: "Password",
                            hintText: "Enter Password",
                            isObscure: false,
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
                            controller: context
                                .read<RegisterCubit>()
                                .rePasswordController,
                            labelText: "Confirm password",
                            hintText: "Confirm password",
                            isObscure: false,
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
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff02369C),
                        ),
                        onPressed: () async {
                          if (context
                              .read<RegisterCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            bool success =
                                await context.read<RegisterCubit>().register();
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:  Text("تم التسجيل بنجاح "),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("لم يتم التسجيل بنجاح "),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
