import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/generated/l10n.dart';

class StudentCoursesModel {
  final String name;
  final Color contenercolor, textcolor;

  StudentCoursesModel({required this.name, this.contenercolor = Colors.white, this.textcolor = AppColors.Deep_vilot});
}

class CoursesData {
  Courses (BuildContext context){
    List course = [
    {'name' : S.of(context).current_courses},
    {'name' : S.of(context).completed_courses},
    {'name' : S.of(context).all_courses},
  ];
  }
}