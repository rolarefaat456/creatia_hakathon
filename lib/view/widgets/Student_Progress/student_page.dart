import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/course_section.dart';
import 'package:hacathon_app/componant/jointed_widgets/profile_appbar.dart';
import 'package:hacathon_app/componant/models/button_courses_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/view/widgets/Student_Progress/last_courses.dart';
import 'package:hacathon_app/view/widgets/Student_Progress/student_courses.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // appbar
          Container(height: 70, child: ProfileAppbar()),
          LastCourses(),
            Container(
              // containers el dwrat
              margin: EdgeInsets.only(left: 10),
              height: 50,
              child: StudentCourses(),
            ),
            Expanded(
              child: CourseSection(
                name: '30 of 100', fontfamily: 'Cairo',
                specialIndex: 0,
                specialButtonData: ButtonCoursesModel(text: '100 of 100', fontfamily: 'Cairo', containercolor: AppColors.Dark_Green), source: 'Student',
              )
            ),
        ],
      ),
    );
  }
}