import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_text_form_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'Current password',
                hintText: 'Current password',
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                validator: (value) {},
              ),
              10.verticalSpace,
              CustomTextFormField(
                labelText: 'New password',
                hintText: 'New password',
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                validator: (value) {},
              ),
              10.verticalSpace,
              CustomTextFormField(
                labelText: 'Confirm password',
                hintText: 'Confirm password',
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                validator: (value) {},
              ),
              50.verticalSpace,
              Row(
                children: [
                  CustomButton(onPressed: () {

                  }, text: 'Update'),
                ],
              )
            ],
          ),
        ));
  }
}
