import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/feature/app/presentation/pages/home_screen.dart';
import 'package:online_exam/feature/auth/register/presentation/cubit/register_cubit.dart';
import 'package:online_exam/feature/auth/register/presentation/widget/register_form.dart';


class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold( //
            appBar: AppBar(title: const Text("Sign up")),
            body: Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    Navigator.pushNamed(
                        context,HomeScreen.routeName);
                  } else if (state is RegisterFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: const RegisterForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
