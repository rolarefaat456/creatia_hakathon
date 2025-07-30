
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_courses_section.dart';
import 'package:hacathon_app/view/widgets/Student_Progress/courses_content_view.dart';
import 'package:hacathon_app/componant/jointed_widgets/instuctor_info_model.dart';
import 'package:hacathon_app/componant/models/button_courses_model.dart';
import 'package:hacathon_app/componant/models/course_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/view/widgets/bookcouse/book_course_content.dart';

class CourseSection extends StatelessWidget {
  CourseSection({
    super.key, required this.name, required this.fontfamily, this.containercolor = AppColors.Blue, this.specialIndex, this.specialButtonData, required this.source,
  });

  CourseData courseData = CourseData();

  final String name, fontfamily, source;
  final int? specialIndex;
  final Color containercolor;
  final ButtonCoursesModel? specialButtonData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: courseData.courses.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.sizeOf(context).width<815?
              2:MediaQuery.sizeOf(context).width<1000?
              3
              :MediaQuery.sizeOf(context).width<1400?
              4
              :5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: MediaQuery.sizeOf(context).width<815?
          MediaQuery.sizeOf(context).height/2.5:
          MediaQuery.sizeOf(context).width<1000?
          MediaQuery.sizeOf(context).height/3
          :MediaQuery.sizeOf(context).width<1400?
          MediaQuery.sizeOf(context).height/3.5
          :MediaQuery.sizeOf(context).height/2,
      ),
      itemBuilder: (context, index) {
        bool isSpecial = index == specialIndex;
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  if ( source == 'Home' )
                  {
                    return BookCourseContent(instuctorInfoModel: InstuctorInfoModel(
                    image: courseData.courses[index].image,
                    name: courseData.courses[index].person_name,
                    phone: '+20 01098765432'
                    ),);
                  }else{
                    return CoursesContentView(instuctorInfoModel: InstuctorInfoModel(
                    image: courseData.courses[index].image,
                    name: courseData.courses[index].person_name,
                    phone: '+20 01098765432'
                    ), index: index,
                    );
                  }
                },
              )
            );
          },child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Stack( // image & favorite icon
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 204,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(20),
                            child: Image.asset(courseData.courses[index].image, fit: BoxFit.fill,)
                          ),
                        ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26)
                            ),
                            child: Center(
                              child: IconButton(onPressed: () {
                              }, icon: Center(child: Icon(Icons.favorite_border, size: 9,))
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding( // course name
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        courseData.courses[index].course_name,
                        style: AppText.style12w400(context).copyWith(color: AppColors.Black),
                      ),
                    ),
                    Container( // asm elly byshr7
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          courseData.courses[index].person_name,
                          style: AppText.style12w400(context).copyWith(color: AppColors.Grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Container( // el tkym
                      margin: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(Icons.star_rounded, color: AppColors.StarYellow,),
                          Icon(Icons.star_rounded, color: AppColors.StarYellow,),
                          Icon(Icons.star_rounded, color: AppColors.StarYellow,),
                          Icon(Icons.star_rounded, color: AppColors.StarYellow,),
                          Icon(Icons.star_half_rounded, color: AppColors.StarYellow)
                        ],
                      ),
                    ),
                    ButtonoursesSection(
                      buttonCoursesModel: isSpecial && specialButtonData != null
                          ? specialButtonData!
                          : ButtonCoursesModel(
                              text: name,
                              fontfamily: fontfamily,
                              containercolor: containercolor,
                            ),
                    )
                    // ButtonoursesSection(buttonCoursesModel: ButtonCoursesModel(text: name, fontfamily: fontfamily, containercolor: containercolor),)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
