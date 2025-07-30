import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/jointed_widgets/course_section.dart';
import 'package:hacathon_app/componant/jointed_widgets/section_name.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SectionName(name: 'الدورات المفضلة',),
          Expanded(
            child: CourseSection(name: 'الحجز : 1 أغسطس 2025', fontfamily: 'VEXA', source: 'Home',)
        ),
        ],
      ),
    );
  }
}
