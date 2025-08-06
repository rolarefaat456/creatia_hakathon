import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/course_section.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/views/widgets/home/astronaut_section.dart';
import 'package:hacathon_app/views/widgets/home/creativa_sections.dart';
import 'package:hacathon_app/views/widgets/home/search.dart';

// الصفحة الرئيسية لعرض الأقسام والكورسات
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
            // حقل البحث
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: Search(),
            ),
            // صورة بانر
            AstronautSecction(),
            // sections
            // أقسام الكورسات
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: CreativaSections()
            ),
            // section courses
            // الكورسات
            Expanded(
              child: CourseSection(name: S.of(context).booking_date, fontfamily: 'VEXA', source: 'Home',)
            ),
          ],
        )
      ),
    );
  }
}
