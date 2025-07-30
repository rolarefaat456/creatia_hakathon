import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/courses_data_levels.dart';
import 'package:hacathon_app/componant/jointed_widgets/instructor_info.dart';
import 'package:hacathon_app/componant/jointed_widgets/instuctor_info_model.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/profile_appbar.dart';
import 'package:hacathon_app/componant/models/person_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/view/widgets/bookcouse/book_dialog.dart';

class BookCourseContent extends StatelessWidget {
  BookCourseContent({super.key, required this.instuctorInfoModel});

  BookDialog bookDialog = BookDialog();

  final InstuctorInfoModel instuctorInfoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 70, child: ProfileAppbar()),
            InstructorInfo( // m3lomat el modarb
                personModel: PersonModel(
                  image: instuctorInfoModel.image,
                  name:'${instuctorInfoModel.name} : المدرب ',
                  emailorphone: instuctorInfoModel.phone
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ListTile(
                        leading: Image.asset(Assets.imagesFlutterLogo),
                        title: Text(
                          'Flutter  Tutorial',
                          style: AppText.style16w400(context).copyWith(fontFamily: 'Finger_Paint', color: AppColors.Blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Divider(
                        height: 10,
                        color: Colors.black12,
                      ),
                    ),
                    CoursesDataLevels()
                  ],
                ),
              ),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))
                      ),
                      onPressed: () {
                      bookDialog.showbookdialog(context);
                      }, child: Row(
                        children: [
                          Image.asset(Assets.imagesStudent, width: 30,height: 30,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                            child: Text(
                              'إحجز الان' ,
                              style: AppText.style12w400(context),
                            ),
                          ),
                        ],
                      )
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
                                  onTap: () {
                                  },
                                  child: Image.asset(Assets.imagesCertificate, width: 30,height: 30,)
                                )
                                ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
