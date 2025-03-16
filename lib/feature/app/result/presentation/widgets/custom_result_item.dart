
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/app/result/presentation/pages/answers_screen.dart';

class CustomResultItem extends StatelessWidget {
   CustomResultItem({super.key,required this.text});
  String text;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, AnswersScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.all(5.sp),
              width: double.infinity,
              height: 103.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/Profit.png'),
                    title:  Text(text),
                    subtitle: const Text('20 Question'),
                    trailing: const Text('30 minutes',
                        style: TextStyle(fontSize: 14)),
                  ),
                  const Text('18 corrected answers in 25 minutes'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
