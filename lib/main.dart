import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/theme_manager.dart';

import 'core/di/di.dart';
import 'core/utils/sharedpreferences.dart';
import 'feature/app/explore/presentation/cubit/question/question_cubit.dart';
import 'feature/app/explore/presentation/pages/home_screen.dart';
import 'feature/app/explore/presentation/pages/question_screen.dart';

import 'feature/app/home_body.dart';
import 'feature/app/profile/presentation/page/change_password.dart';
import 'feature/app/profile/presentation/page/edit_profile_screen.dart';
import 'feature/app/result/presentation/pages/answers_screen.dart';
import 'feature/auth/confirmation/presentation/pages/forget_password_screen.dart';
import 'feature/auth/login/presentation/pages/login_screen.dart';
import 'feature/auth/register/presentation/pages/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Shared.init();
  await ScreenUtil.ensureScreenSize();

  var user = Shared.getDat(key: 'Token');
  String initialRoute = (user == null) ? LoginScreen.routeName : HomeScreen.routeName;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>getIt<QuestionCubit>()),

      ],
      child: OnlineExam(route: initialRoute),
    ),
  );
}

class OnlineExam extends StatelessWidget {
  final String route;

  const OnlineExam({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.appTheme,
          initialRoute: route,
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
            QuestionScreen.routeName: (context) =>  QuestionScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            EditProfileScreen.routeName: (context) => EditProfileScreen(),
            ChangePassword.routeName: (context) => ChangePassword(),
            HomeBody.routeName: (context) => HomeBody(),
            AnswersScreen.routeName: (context) => AnswersScreen(),
          },
        );
      },
    );
  }
}
