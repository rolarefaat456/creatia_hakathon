import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
class ButtonModel {
  final String text;
  final VoidCallback onPress;
  final Color color;
  final double horizontal;
  final Color textcolor;

  ButtonModel({required this.text, required this.horizontal, required this.onPress, this.color = AppColors.Blue, this.textcolor = AppColors.white });
}