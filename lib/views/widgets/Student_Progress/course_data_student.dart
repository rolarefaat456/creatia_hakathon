
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class CourseDataStudent extends StatelessWidget {
  const CourseDataStudent({
    super.key, required this.text, required this.width, required this.color,
  });
  final String text;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: AppText.style10w500(context).copyWith(fontFamily: 'Cairo'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 4,
          width: 92,
          decoration: BoxDecoration(
            color: AppColors.greychart
          ),
          child: Row(
            children: [
              Container(
                height: 4,
                width: width,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2)
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
