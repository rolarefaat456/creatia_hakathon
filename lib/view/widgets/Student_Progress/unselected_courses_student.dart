
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/student_courses_model.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class UnselectedCoursesStudent extends StatelessWidget {
  const UnselectedCoursesStudent({
    super.key, required this.studentCoursesModel,
  });

  final StudentCoursesModel studentCoursesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 42,
      // height: 42,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: studentCoursesModel.contenercolor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          studentCoursesModel.name,
          style: AppText.style12w400(context).copyWith(fontFamily: 'Tajawal', color: studentCoursesModel.textcolor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
