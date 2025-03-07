import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/utils/sharedpreferences.dart';
import 'feature/app/presentation/pages/home_screen.dart';
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
          home: const LoginScreen(),
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
          },
        );
      },
    );
  }
}

//flutter packages pub run build_runner watch
