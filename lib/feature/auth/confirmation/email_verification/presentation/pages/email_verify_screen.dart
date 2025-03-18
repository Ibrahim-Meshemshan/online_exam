import 'package:exam_app/config/constant.dart';
import 'package:exam_app/features/forgot_password/forget_pass/presentation/view/widgets/custom_button.dart';
import 'package:exam_app/features/forgot_password/reset_password/presentation/view/screens/reset_password_screen.dart';
import 'package:exam_app/features/forgot_password/verifing_email/presentation/view_model/cubit.dart';
import 'package:exam_app/features/forgot_password/verifing_email/presentation/view_model/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
                return const Center(
                  child: CircularProgressIndicator(
                    color: Constant.kPrimaryColor,
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
                        color: Constant.greyColor,
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
                            cursorColor: Constant.kPrimaryColor,
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
                    CustomButton(
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
                      child: const Text(
                        'Verify Code',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Constant.kPrimaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: Constant.kPrimaryColor,
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