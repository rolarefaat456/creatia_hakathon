import 'package:flutter/material.dart';
import 'package:hacathon_app/components/jointed_widgets/course_section.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/views/widgets/home/astronaut_section.dart';
import 'package:hacathon_app/views/widgets/home/creativa_sections.dart';
import 'package:hacathon_app/views/widgets/home/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container
      (
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: Search(),
            ),
            // image ra2d el fda2
            AstronautSecction(),
            // sections
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: CreativaSections()
            ),
            // section courses
            Expanded(
              child: CourseSection(name: 'الحجز : 1 أغسطس 2025', fontfamily: 'VEXA', source: 'Home',)
            ),
          ],
        )
      ),
    );
  }
}
