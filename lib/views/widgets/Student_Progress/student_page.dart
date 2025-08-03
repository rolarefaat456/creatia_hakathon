import 'package:flutter/material.dart';
import 'package:hacathon_app/components/jointed_widgets/course_section.dart';
import 'package:hacathon_app/components/jointed_widgets/profile_appbar.dart';
import 'package:hacathon_app/components/models/button_courses_model.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/views/widgets/Student_Progress/course_data_student.dart';
import 'package:hacathon_app/views/widgets/Student_Progress/last_courses.dart';
import 'package:hacathon_app/views/widgets/Student_Progress/student_courses.dart';

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
          Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          children: [
            Row(
              children: [
                MediaQuery.sizeOf(context).width<600?
                Expanded(child: Chart()):
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 190,
                    // minHeight: 50
                  ),
                  // margin: EdgeInsets.all(10),
                  // height: 190,
                  child: Chart()
                ),
                MediaQuery.sizeOf(context).width<600?
                Container():
                Spacer(),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'اخر الدورات :',
                        style: AppText.style11w500(context).copyWith(color: AppColors.Baby_Black),
                        textDirection: TextDirection.rtl
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'برمجة تطبيقات Flutter',
                    style: AppText.style14w400(context),
                    textDirection: TextDirection.rtl
                  ),
                ),
                Container(
                  width: 250,
                  child: ListTile(
                    trailing: CircleAvatar(backgroundImage: AssetImage(Assets.imagesElprofile)),
                    title: Text(
                      'instructor',
                      style: AppText.style9w500(context).copyWith(color: AppColors.Grey),
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(
                      'Mohammed Hanafy Mahmoud',
                      style: AppText.style9w500(context),
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CourseDataStudent(text: 'Basics Dart : 64 %', width: 56, color: AppColors.YellowOrange,),
                CourseDataStudent(text: 'Flutter Widgets : 30 %', width: 28, color: AppColors.Blue,),
                CourseDataStudent(text: 'Provider : 80 %', width: 70, color: AppColors.White_Blue,),
              ],
            )
          ],
        ),
    ),
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