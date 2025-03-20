
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam/core/utils/theme_manager.dart';

import '../../../../login/presentation/widgets/custom_button.dart';
import '../../../reset_password/presentation/pages/reset_password_screen.dart';
import '../cubit/email_verify_cubit.dart';
import '../cubit/email_verify_state.dart';

class EmailVerificationScreen extends StatefulWidget {
  static const String routeName = 'email_verify_screen';
  const EmailVerificationScreen({super.key});

  @override
  EmailVerificationScreenState createState() => EmailVerificationScreenState();
}

class EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final List<TextEditingController> controllers =
  List.generate(4, (index) => TextEditingController());
  String verificationCode = '';
  bool isValid = true;

  void submitCode() {
    verificationCode = controllers.map((controller) => controller.text).join();
    if (verificationCode != '1234') {
      setState(() {
        isValid = false;
      });
    } else {
      setState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    EmailVerificationViewModel viewModel =
    GetIt.I<EmailVerificationViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
        child: BlocProvider(
          create: (context) => viewModel,
          child:
          BlocConsumer<EmailVerificationViewModel, EmailVerificationState>(
            listener: (context, state) {
              if (state is EmailVerificationSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code verified successfully!')),
                );
              } else if (state is EmailVerificationFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              if (state is EmailVerificationLoading) {
                return  Center(
                  child: CircularProgressIndicator(
                    color: ThemeManager.buttonColor,
                  ),
                );
              } else if (state is EmailVerificationFailure) {
                print(state.error.toString());
                return const Text('Error');
              } else {
                return Column(
                  children: [
                    const Text(
                      'Email verification',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Please enter your code that send to your\n email address',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xffDFE7F7),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isValid ? Colors.transparent : Colors.red,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: ThemeManager.buttonColor,
                            style: const TextStyle(
                              fontSize: 26,
                            ),
                            controller: controllers[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 3) {
                                FocusScope.of(context)
                                    .nextFocus(); // Move to next field
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context)
                                    .previousFocus(); // Move to previous field
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 8),
                    if (!isValid) // Show error message if the code is invalid
                      const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: Colors.red,
                              size: 12,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Invalid code',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        CustomButton(
                          backgroundColor: ThemeManager.buttonColor,
                          onPressed: () async {
                            submitCode();
                            final code = verificationCode;
                            if (code.isNotEmpty) {
                              await viewModel.verifyEmail(code);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ResetPasswordScreen();
                                  },
                                ),
                              );
                            }
                          },
                          text: 'Verify Code',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Didn’t receive code? ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child:  Text(
                            'Resend',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ThemeManager.buttonColor,
                              decoration: TextDecoration.underline,
                              decorationColor: ThemeManager.buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}