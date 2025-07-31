
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class Button_Sign extends StatelessWidget {

  final String text;
  final VoidCallback onPress;
  final Color color;
  final double horizontal;
  final Color textcolor;

  const Button_Sign({super.key,required this.text, required this.horizontal, required this.onPress, this.color = AppColors.Blue, this.textcolor = AppColors.white });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: horizontal ),
        child: Text(
          text,
          style: AppText.style12w400(context).copyWith(color: textcolor),
        ),
      )
    );
  }
}