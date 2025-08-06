import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/courses_data_levels.dart';
import 'package:hacathon_app/components/widgets/instructor_info.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/components/widgets/profile_appbar.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/views/widgets/bookcouse/book_dialog.dart';

// ignore: must_be_immutable
class BookCourseContent extends StatelessWidget {
  BookCourseContent({
    super.key,
    required this.image,
    required this.name,
    required this.phone, required this.source,
  });
// Dialog خاص بالحجز
  BookDialog bookDialog = BookDialog();

  final String image, name, phone, source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar المستخدم في البروفايل
            Container(height: 70, child: ProfileAppbar()),
            // معلومات المدرب
            InstructorInfo(
              // m3lomat el modarb
              image: image,
              name: '${name} : ${S.of(context).instructor_label} ',
              emailorphone: phone,
            ),
// حاوية معلومات الكورس ومستواه
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // اسم الكورس وشعاره
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListTile(
                      leading: Image.asset(Assets.imagesFlutterLogo),
                      title: Text(
                        'Flutter  Tutorial',
                        style: AppText.style16w400(context).copyWith(
                          fontFamily: 'Finger_Paint',
                          color: AppColors.Blue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Divider(height: 10, color: Colors.black12),
                  ),
                  // Widget خاص بعرض مستويات الكورسات
                  CoursesDataLevels(source: source,),
                ],
              ),
            ),
            // زرار الحجز وزرار الشهادة
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.Blue,
                      elevation: 0,
                      minimumSize: Size(200, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                    onPressed: () {
                      bookDialog.showbookdialog(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesStudent,
                          width: 30,
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 50,
                          ),
                          child: Text(
                            S.of(context).book_now,
                            style: AppText.style12w400(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        Assets.imagesCertificate,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
