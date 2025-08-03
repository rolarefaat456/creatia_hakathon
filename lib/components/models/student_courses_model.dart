import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';

class StudentCoursesModel {
  final String name;
  final Color contenercolor, textcolor;

  StudentCoursesModel({required this.name, this.contenercolor = Colors.white, this.textcolor = AppColors.Deep_vilot});
}

class CoursesData {
  List course = [
    {'name' : 'الدورات الحالية'},
    {'name' : 'الدورات المنجزة'},
    {'name' : 'كل الدورات'},
  ];
}