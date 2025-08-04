
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class CourseDataSelected extends StatelessWidget {
  const CourseDataSelected({
    super.key, required this.name, this.contenercolor = Colors.white, this.textcolor = AppColors.Deep_vilot
  });

  final String name;
  final Color contenercolor, textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: contenercolor,
        borderRadius: BorderRadius.circular(21)
      ),
      child: Center(
        child: Text(
          name,
          style: AppText.style12w400(context).copyWith(fontFamily: 'Tajawal', color: textcolor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
