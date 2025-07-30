import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';

double getScaleFactor( BuildContext context ){
  double width = MediaQuery.sizeOf(context).width;
  if( width < 600 ){
    return width / 400;
  }else if( width < 900 ){
    return width / 700;
  }else{
    return width / 1000;
  }
}

double getResponseFontSize( BuildContext context, double fontsize ){
  double scaleFactor = getScaleFactor(context);
  double responsivefontsize = fontsize * scaleFactor;
  double lowerLimit = responsivefontsize * 0.8;
  double upperLimit = responsivefontsize * 1.2;
  return responsivefontsize.clamp(lowerLimit, upperLimit);
}

abstract class AppText {
  static TextStyle style32w400(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 28),
      fontWeight: FontWeight.w400,
      fontFamily: 'VEXA',
      color: AppColors.navy,
      decoration: TextDecoration.none,
    );
  }
  static TextStyle style24w800(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 24),
      fontWeight: FontWeight.w800,
      fontFamily: 'Cairo',
      color: AppColors.Blue
    );
  }
  static TextStyle style24w700(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 24),
      fontWeight: FontWeight.w800,
      fontFamily: 'Inter',
      color: AppColors.starcodecolor
    );
  }
  static TextStyle style22w400(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 20),
      fontWeight: FontWeight.w400,
      fontFamily: 'VEXA_light_R',
      color: AppColors.navy,
      decoration: TextDecoration.none,
    );
  }
  static TextStyle style18w800(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 18),
      fontWeight: FontWeight.w800,
      fontFamily: 'VEXA',
      color: AppColors.Blue,
      decoration: TextDecoration.none,
    );
  }
  static TextStyle style18w400(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 18),
      fontWeight: FontWeight.w400,
      fontFamily: 'VEXA',
      color: AppColors.Deep_vilot,
      decoration: TextDecoration.none,
    );
  }
  static TextStyle style16w800(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 16),
      fontWeight: FontWeight.w800,
      fontFamily: 'Nunito',
      color: AppColors.Baby_Black,
      decoration: TextDecoration.none,
    );
  }
  static TextStyle style16w400(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 16),
      fontWeight: FontWeight.w400,
      fontFamily: 'Almarai',
      color: AppColors.Black_Grey
    );
  }
  static TextStyle style14w400(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 14),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
      color: AppColors.Deep_vilot,
      decoration: TextDecoration.none,
    );
  }
  static TextStyle style12w700(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 12),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      color: AppColors.Volit_Blue
    );
  }
  static TextStyle style12w400(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 12),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
      color: AppColors.white
    );
  }
  static TextStyle style12w500(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 12),
      fontWeight: FontWeight.w500,
      fontFamily: 'Cairo',
      color: AppColors.white
    );
  }
  static TextStyle style11w500(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 11),
      fontWeight: FontWeight.w500,
      fontFamily: 'Cairo',
      color: AppColors.Grey,
      decoration: TextDecoration.none,
    );
  }
  static TextStyle style10w600(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 10),
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
      color: AppColors.Grey
    );
  }
  static TextStyle style10w500(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 10),
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal',
      color: AppColors.Black
    );
  }
  static TextStyle style10w400(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 10),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
      color: AppColors.white
    );
  }
  static TextStyle style9w500(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 9),
      fontWeight: FontWeight.w500,
      fontFamily: 'Cairo',
      color: AppColors.Black_Grey
    );
  }
  static TextStyle style8w700(context){
    return TextStyle(
      fontSize: getResponseFontSize(context, 8),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      color: AppColors.white
    );
  }
}