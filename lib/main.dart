import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/theme_manager.dart';

import 'core/di/di.dart';
import 'core/utils/sharedpreferences.dart';
import 'feature/app/explore/presentation/pages/home_screen.dart';
import 'feature/app/home_body.dart';
import 'feature/app/profile/presentation/page/change_password.dart';
import 'feature/app/profile/presentation/page/edit_profile_screen.dart';
import 'feature/app/result/presentation/pages/answers_screen.dart';
import 'feature/auth/confirmation/presentation/pages/forget_password_screen.dart';
import 'feature/auth/login/presentation/pages/login_screen.dart';
import 'feature/auth/register/presentation/pages/register_screen.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  var user = Shared.getDat(key: 'Token');
  await ScreenUtil.ensureScreenSize();
  String route;
  if (user == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreen.routeName;
  }
  runApp(Online_Exam(
    route: route,
  ),);
}

// ignore: must_be_immutable
class Online_Exam extends StatelessWidget {
  String route;

  Online_Exam({super.key, required this.route});

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
          home: const LoginScreen(),
          initialRoute: HomeBody.routeName,
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
            HomeScreen.routeName: (context) =>  HomeScreen(),
            ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            EditProfileScreen.routeName: (context) =>  EditProfileScreen(),
            ChangePassword.routeName: (context) =>  ChangePassword(),
            HomeBody.routeName: (context) =>  HomeBody(),
            AnswersScreen.routeName: (context) =>   AnswersScreen(),
          },
        );
      },
    );
  }
}

//flutter packages pub run build_runner watch
//flutter packages pub run build_runner build
