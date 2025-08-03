import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';

class ButtonCoursesModel {
  final String text, fontfamily;
  final Color containercolor;

  ButtonCoursesModel({required this.text, required this.fontfamily, this.containercolor = AppColors.Blue});
}