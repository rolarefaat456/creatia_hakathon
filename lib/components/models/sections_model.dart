import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';

class SectionsModel {
  final String name;
  final Color contenercolor, textcolor;

  SectionsModel({required this.name, this.contenercolor = Colors.white, this.textcolor = AppColors.Deep_vilot});
}

class sectionsData {
  List sectiondata = [
    {'name' : 'الكل'},
    {'name' : 'UX & UI Design'},
    {'name' : 'Web Development'},
    {'name' : 'IT'},
    {'name' : 'Graphic Design'},
    {'name' : 'Data Science'},
    {'name' : 'AI'},
  ];
}