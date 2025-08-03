import 'package:flutter/material.dart';
import 'package:hacathon_app/components/models/student_courses_model.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/Student_Progress/course_data_selected.dart';
import 'package:hacathon_app/views/widgets/Student_Progress/unselected_courses_student.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StudentCourses extends StatelessWidget {
  StudentCourses({super.key});

  CoursesData coursesData = CoursesData();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coursesData.course.length,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: value.selectedindex == index
                    ? AppColors.Blue
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  value.seclected(index);
                },
                child: value.selectedindex == index
                    ? CourseDataSelected(
                        studentCoursesModel: StudentCoursesModel(
                          name: coursesData.course[index]['name'],
                          contenercolor: AppColors.Blue,
                          textcolor: Colors.white,
                        ),
                      )
                    : UnselectedCoursesStudent(
                        studentCoursesModel: StudentCoursesModel(
                          name: coursesData.course[index]['name'],
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
