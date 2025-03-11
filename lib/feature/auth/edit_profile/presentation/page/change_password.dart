import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_text_form_field.dart';

import '../cubit/profile_view_model_cubit.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Current password',
                        hintText: '',
                        keyboardType: TextInputType.name,
                        controller: TextEditingController(),
                        validator: (value) {},
                      ),
                      10.verticalSpace,
                      CustomTextFormField(
                        labelText: 'New password',
                        hintText: '',
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
                          CustomButton(onPressed: () {}, text: 'Update'),
                        ],
                      )
                    ],
                  );
                },
              );
            },
          ),
        ));
  }
}
