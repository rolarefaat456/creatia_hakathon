
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class Button_Sign extends StatelessWidget {

  final String text;
  final Color color, textcolor;
  final VoidCallback onPress;
  final double horizontal;

  const Button_Sign({super.key, this.textcolor = Colors.white, required this.text, this.color = AppColors.Blue , required this.onPress, required this.horizontal });

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