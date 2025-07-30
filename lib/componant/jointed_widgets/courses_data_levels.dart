
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/course_level_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class CoursesDataLevels extends StatelessWidget {
  CoursesDataLevels({
    super.key,
  });

  CourseLevel courseLevel = CourseLevel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: courseLevel.levels.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              courseLevel.levels[index].title,
              style: AppText.style16w400(context).copyWith(fontFamily: 'Finger_Paint', color: AppColors.Blue),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                courseLevel.levels[index].subtitle,
                textAlign: TextAlign.start,
                style: AppText.style12w400(context).copyWith(color: AppColors.Black),
              ),
            ),
        );
      }
    );
  }
}