import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/theme_manager.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_text_form_field.dart';

import 'change_password.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = 'edit_profile';

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/Photo.png'),
              ),
              CustomTextFormField(
                labelText: 'User name',
                hintText: '',
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                validator: (value) {},
              ),
              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'First name',
                      hintText: '',
                      keyboardType: TextInputType.name,
                      controller: TextEditingController(),
                      validator: (value) {},
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Last name',
                      hintText: '',
                      keyboardType: TextInputType.name,
                      controller: TextEditingController(),
                      validator: (value) {},
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              CustomTextFormField(
                labelText: 'Email',
                hintText: '',
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                validator: (value) {},
              ),
              CustomTextFormField(
                labelText: 'Password',
                hintText: '********',
                suffix: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ChangePassword();
                      },
                    ));
                  },
                  child: Text(
                    'Change',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ThemeManager.buttonColor,
                        ),
                  ),
                ),
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                validator: (value) {},
              ),
              CustomTextFormField(
                labelText: 'Phone number',
                hintText: '',
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                validator: (value) {},
              ),
              50.verticalSpace,
              Row(
                children: [
                  CustomButton(onPressed: () {}, text: 'Update'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
