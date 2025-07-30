
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/button_courses_model.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class ButtonoursesSection extends StatelessWidget {
  const ButtonoursesSection({
    super.key, required this.buttonCoursesModel,
  });

  final ButtonCoursesModel buttonCoursesModel;

  @override
  Widget build(BuildContext context) {
    return Container( // m3ad el course
      margin: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: buttonCoursesModel.containercolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          buttonCoursesModel.text,
          style: AppText.style12w400(context).copyWith(fontFamily: buttonCoursesModel.fontfamily),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
