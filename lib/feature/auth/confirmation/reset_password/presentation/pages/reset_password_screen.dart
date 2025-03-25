import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/theme_manager.dart';

import '../../../../login/presentation/widgets/custom_button.dart';
import '../../../../login/presentation/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? errorMessage;

  void resetPassword() {
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Simple validation
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        errorMessage = 'Password must not be empty';
      });
    } else if (newPassword.length < 6 ||
        !RegExp(r'[A-Z]').hasMatch(newPassword) ||
        !RegExp(r'[0-9]').hasMatch(newPassword)) {
      setState(() {
        errorMessage =
            'Password must contain at least 6 characters, one upper case letter, and one number';
      });
    } else if (newPassword != confirmPassword) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
    } else {
      setState(() {
        errorMessage = null; // Reset error message
      });

      // Proceed with reset logic
      print('Password reset successfully to: $newPassword');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            const Text(
              'Reset password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
             const Text(
              'Password must not be empty and must\n contain 6 characters with upper case\n letter and one number at least',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              readOnly: false,
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              hintText: 'New password',
              labelText: 'Enter your password',
              validator: (value) {},
            ),
            const SizedBox(height: 25),
            CustomTextFormField(
              readOnly: false,
              hintText: 'Confirm password',
              labelText: 'Confirm password',
              keyboardType: TextInputType.text,
              controller: TextEditingController(),
              validator: (value) {},
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                CustomButton(
                  backgroundColor: ThemeManager.buttonColor,
                  onPressed: () {},
                  text: 'Continue',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
