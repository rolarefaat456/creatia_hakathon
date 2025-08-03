
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/models/student_courses_model.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class CourseDataSelected extends StatelessWidget {
  const CourseDataSelected({
    super.key, required this.studentCoursesModel,
  });

  final StudentCoursesModel studentCoursesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: studentCoursesModel.contenercolor,
        borderRadius: BorderRadius.circular(21)
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
